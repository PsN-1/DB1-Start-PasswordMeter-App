//
//  SequentialSymbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialSymbols: AnalysisResult {
    var password: String
    private var countOfSequentialSymbols: Int = 0
    private var bonusOfSequentialLettersSymbols: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialSymbols()
        calculateBonusOfSequentialSymbols()
        calculateRequirementLevel()
    }
    
    func calculateCountOfSequentialSymbols() {
        for i in 0..<8 {
            let Symbols = ")!@#$%^&*()"
            let arraySymbols = Array(Symbols)
            var sFwd = ""
            for j in i..<i+3 {
                sFwd += "\(arraySymbols[j])"
            }
            let sRev = String(sFwd.reversed())
            if password.lowercased().contains(sFwd) || password.lowercased().contains(sRev) {
                countOfSequentialSymbols += 1
            }
        }
    }
    
    func calculateBonusOfSequentialSymbols() {
        if (countOfSequentialSymbols > 0) {
            let multiplierSeqSymbol = 3
            bonusOfSequentialLettersSymbols = countOfSequentialSymbols * multiplierSeqSymbol;
        }
    }
    
    func calculateRequirementLevel() {
        if (countOfSequentialSymbols > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "SequentialNumbers", count: countOfSequentialSymbols, bonus: bonusOfSequentialLettersSymbols, requirementLevel: requirementLevel!)
    }
}
