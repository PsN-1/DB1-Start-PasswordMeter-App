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
        let arrayOfLetters: [Character] = Array(password)
        
        for letter in arrayOfLetters {
            if letter.isLowercase && letter.isLetter {
                countAlphaLowerCase += 1
            }
        }
    }
    
    func calculateBonusLetterLowerCase() {
        if countAlphaLowerCase > 0 && countAlphaLowerCase < password.count {
            bonusAlphaLowerCase = (password.count - countAlphaLowerCase) * 2
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
