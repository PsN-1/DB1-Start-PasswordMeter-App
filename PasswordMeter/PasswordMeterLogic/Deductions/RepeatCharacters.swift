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
        let arrayOfLetters: [Character] = Array(password)
        
        for i in 0..<arrayOfLetters.count {
            var bCharExists = false
            for j in 0..<arrayOfLetters.count {
                if arrayOfLetters[i] == arrayOfLetters[j] && i != j {
                    bCharExists = true
                    incrementDeductionOfRepeatedChars += Double(abs(Double(arrayOfLetters.count) / ( Double(j) - Double(i)) ))
                }
            }
            if bCharExists {
                count += 1
                let countUniqueCharacters = arrayOfLetters.count - count
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

