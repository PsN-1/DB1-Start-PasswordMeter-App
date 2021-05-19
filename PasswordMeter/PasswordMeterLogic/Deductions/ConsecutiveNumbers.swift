//
//  ConsecutiveNumbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveNumbers: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var indexOfNumberCharacter: Int?
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveNumbers()
        calculateBonusOfConsecutiveNumbers()
        calculateRequirementLevel()
    }
    
    func calculateCountOfConsecutiveNumbers() {
        let letters: [Character] = Array(password)
        
        for currentCharacter in 0..<letters.count {
            if letters[currentCharacter].isNumber {
                if let indexOfPreviousNumberCharacter = indexOfNumberCharacter {
                    if (indexOfPreviousNumberCharacter + 1 == currentCharacter) {
                        count += 1
                    }
                }
                indexOfNumberCharacter = currentCharacter
            }
        }
    }
    
    func calculateBonusOfConsecutiveNumbers() {
        let bonusMultiplier = 2
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
        return Results(className: "Consecutive Numbers", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
