//
//  ConsecutiveNumbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveNumbers: AnalysisResult {
    var password: String
    private var countConsecutiveNumber: Int = 0
    private var bonusConsecutiveNumber: Int = 0
    private var nTmpNumber: Int? = nil
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveNumbers()
        calculateBonusOfConsecutiveNumbers()
        calculateRequirementLevel()
    }
    
    func calculateCountOfConsecutiveNumbers() {
        let arrayOfLetters: [Character] = Array(password)
        
        for i in 0..<arrayOfLetters.count {
            if arrayOfLetters[i].isNumber {
                if (nTmpNumber != nil) {
                    if (nTmpNumber! + 1 == i) {
                        countConsecutiveNumber += 1
                    }
                }
                nTmpNumber = i
            }
        }
    }
    
    func calculateBonusOfConsecutiveNumbers() {
        if (countConsecutiveNumber > 0) {
            let multiplierConsecutiveNumber = 2
            bonusConsecutiveNumber = countConsecutiveNumber * multiplierConsecutiveNumber;
        }
    }
    
    func calculateRequirementLevel() {
        if (countConsecutiveNumber > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Consecutive Numbers", count: countConsecutiveNumber, bonus: bonusConsecutiveNumber, requirementLevel: requirementLevel)
    }
}
