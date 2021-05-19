//
//  RepeatCharacters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class RepeatCharacters: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var incrementDeductionOfRepeatedChars: Double = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfRepeatedCharacters()
        calculateBonusOfRepeatedCharacters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfRepeatedCharacters() {
        let letters: [Character] = Array(password)
        
        for i in 0..<letters.count {
            var bCharExists = false
            for j in 0..<letters.count {
                if letters[i] == letters[j] && i != j {
                    bCharExists = true
                    incrementDeductionOfRepeatedChars += Double(abs(Double(letters.count) / ( Double(j) - Double(i)) ))
                }
            }
            if bCharExists {
                count += 1
                let countUniqueCharacters = letters.count - count
                incrementDeductionOfRepeatedChars = (countUniqueCharacters != 0) ? ceil(incrementDeductionOfRepeatedChars / Double(countUniqueCharacters)) : ceil(incrementDeductionOfRepeatedChars)
            }
        }
    }
    
    func calculateBonusOfRepeatedCharacters() {
        if (count > 0) {
            bonus = Int(incrementDeductionOfRepeatedChars)
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
        return Results(className: "Repeat Characters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}

