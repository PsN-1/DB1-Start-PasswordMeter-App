//
//  UppercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class UppercaseLetters: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfUpperCaseLetter()
        calculateBonusLetterUpperCase()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfUpperCaseLetter() {
        password.forEach { character in
            if character.isUppercase && character.isLetter {
                count += 1
            }
        }
    }
    
    private func calculateBonusLetterUpperCase() {
        let isNotOnlyUppercaseLetters = count < password.count
        let haveUppercaseLetter = count > 0
        let multiplicadorBonus = 2
        
        if haveUppercaseLetter && isNotOnlyUppercaseLetters {
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
        return Results(className: "Uppercase Letters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
