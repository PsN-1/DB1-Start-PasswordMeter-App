//
//  SequentialNumbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialNumbers: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialNumbers()
        calculateBonusOfSequentialNumbers()
        calculateRequirementLevel()
    }
    
    func calculateCountOfSequentialNumbers() {
        let digits = Array("01234567890")
        let sizeOfGroup = 3
        
        for i in 0..<(digits.count - sizeOfGroup) {
            var groupOfCharacters = ""
            for j in i ..< (i + sizeOfGroup) {
                groupOfCharacters += "\(digits[j])"
            }
            let groupOfCharactersReversed = String(groupOfCharacters.reversed())
            
            if password.lowercased().contains(groupOfCharacters) || password.lowercased().contains(groupOfCharactersReversed) {
                count += 1
            }
        }
    }
    
    func calculateBonusOfSequentialNumbers() {
        let bonusMultiplier = 3
        if count > 0 {
            bonus = count * bonusMultiplier
        }
    }
    
    func calculateRequirementLevel() {
        if (count > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Sequential Numbers", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
