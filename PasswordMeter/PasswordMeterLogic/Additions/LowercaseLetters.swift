//
//  LowercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class LowercaseLetters: AnalysisResult {
    var password: String
    private var countAlphaLowerCase: Int = 0
    private var bonusAlphaLowerCase: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfLowerCaseLetter()
        calculateBonusLetterLowerCase()
        calculateRequirementLevel()
    }
    
    func calculateCountOfLowerCaseLetter() {
        loopClosure().loop(word: password) { letter in
            if letter.isLowercase && letter.isLetter {
                countAlphaLowerCase += 1
            }
        }
    }
    
    func calculateBonusLetterLowerCase() {
        let isNotOnlyLowercaseLetters = countAlphaLowerCase < password.count
        let haveLowercaseLetter = countAlphaLowerCase > 0
        let multiplicadorBonus = 2
        
        if haveLowercaseLetter && isNotOnlyLowercaseLetters {
            bonusAlphaLowerCase = (password.count - countAlphaLowerCase) * multiplicadorBonus
        }
    }
    
    func calculateRequirementLevel() {
        if countAlphaLowerCase <= 0 {
            requirementLevel = RequirementLevel.FAILURE
        } else if countAlphaLowerCase == 1 {
            requirementLevel = RequirementLevel.SUFFICIENT
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL
        }
    }
    
    func getResult() -> Results {
        return Results(className: "LowercaseLetters", count: countAlphaLowerCase, bonus: bonusAlphaLowerCase, requirementLevel: requirementLevel!)
    }
}
