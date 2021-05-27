//
//  LowercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class LowercaseLetters: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfLowerCaseLetter()
        calculateBonusLetterLowerCase()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfLowerCaseLetter() {
        password.forEach { character in
            if character.isLetter && character.isLowercase {
                count += 1
            }
        }
    }
    
    private func calculateBonusLetterLowerCase() {
        let isNotOnlyLowercaseLetters = count < password.count
        let haveLowercaseLetter = count > 0
        let multiplicadorBonus = 2
        
        if haveLowercaseLetter && isNotOnlyLowercaseLetters {
            bonus = (password.count - count) * multiplicadorBonus
        }
    }
    
    private func calculateRequirementLevel() {
        if count <= 0 {
            requirementLevel = RequirementLevel.FAILURE
        } else if count == 1 {
            requirementLevel = RequirementLevel.SUFFICIENT
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Lowercase Letters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
