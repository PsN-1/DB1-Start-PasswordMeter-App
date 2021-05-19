//
//  SequentialNumbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialNumbers: AnalysisResult {
    var password: String
    private var countOfSequentialNumbers: Int = 0
    private var bonusOfSequentialNumbers: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialNumbers()
        calculateBonusOfSequentialNumbers()
        calculateRequirementLevel()
    }
    
    func calculateCountOfSequentialNumbers() {
        for i in 0..<8 {
            let Digits = "01234567890"
            let arrayDigits = Array(Digits)
            var sFwd = ""
            for j in i..<i+3 {
                sFwd += "\(arrayDigits[j])"
            }
            let sRev = String(sFwd.reversed())
            if password.lowercased().contains(sFwd) || password.lowercased().contains(sRev) {
                countOfSequentialNumbers += 1
            }
        }
    }
    
    func calculateBonusOfSequentialNumbers() {
        if (countOfSequentialNumbers > 0) {
            let multiplierSeqNumber = 3
            bonusOfSequentialNumbers = countOfSequentialNumbers * multiplierSeqNumber;
        }
    }
    
    func calculateRequirementLevel() {
        if (countOfSequentialNumbers > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "SequentialNumbers", count: countOfSequentialNumbers, bonus: bonusOfSequentialNumbers, requirementLevel: requirementLevel)
    }
}
