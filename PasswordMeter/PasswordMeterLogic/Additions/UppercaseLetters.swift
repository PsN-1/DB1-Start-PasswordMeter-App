//
//  UppercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class UppercaseLetters: AnalysisResult {
    var password: String
    private var countAlphaUpperCase: Int = 0
    private var bonusAlphaUpperCase: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfUpperCaseLetter()
        calculateBonusLetterUpperCase()
        calculateRequirementLevel()
    }
    
    func calculateCountOfUpperCaseLetter() {
        loopClosure().loop(word: password) { letter in
            if letter.isUppercase && letter.isLetter {
                countAlphaUpperCase += 1
            }
        }
    }
    
    func calculateBonusLetterUpperCase() {
        let isNotOnlyUppercaseLetters = countAlphaUpperCase < password.count
        let haveUppercaseLetter = countAlphaUpperCase > 0
        let multiplicadorBonus = 2
        
        if haveUppercaseLetter && isNotOnlyUppercaseLetters {
            bonusAlphaUpperCase = (password.count - countAlphaUpperCase) * multiplicadorBonus
        }
    }
    
    func calculateRequirementLevel() {
        if countAlphaUpperCase <= 0 {
            requirementLevel = RequirementLevel.FAILURE
        } else if countAlphaUpperCase == 1 {
            requirementLevel = RequirementLevel.SUFFICIENT
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL
        }
    }
    
    func getResult() -> Results {
        return Results(className: "UppercaseLetters", count: countAlphaUpperCase, bonus: bonusAlphaUpperCase, requirementLevel: requirementLevel!)
    }
}
