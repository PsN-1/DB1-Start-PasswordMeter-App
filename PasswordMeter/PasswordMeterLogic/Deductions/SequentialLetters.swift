//
//  SequentialLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialLetters: AnalysisResult {
    var password: String
    private var countOfSequentialLetters: Int = 0
    private var bonusOfSequentialLetters: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialLetters()
        calculateBonusOfSequentialLetters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfSequentialLetters() {
        for i in 0..<23 {
            let Alphas = "abcdefghijklmnopqrstuvwxyz"
            let arrayAlphas = Array(Alphas)
            var sFwd = ""
            for j in i..<i+3 {
                sFwd += "\(arrayAlphas[j])"
            }
            let sRev = String(sFwd.reversed())
            if password.lowercased().contains(sFwd) || password.lowercased().contains(sRev) {
                countOfSequentialLetters += 1
            }
        }
    }
    
    func calculateBonusOfSequentialLetters() {
        if (countOfSequentialLetters > 0) {
            let multiplierSeqAlpha = 3
            bonusOfSequentialLetters = countOfSequentialLetters * multiplierSeqAlpha;
        }
    }
    
    func calculateRequirementLevel() {
        if (countOfSequentialLetters > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "SequentialLetters", count: countOfSequentialLetters, bonus: bonusOfSequentialLetters, requirementLevel: requirementLevel)
    }
}
