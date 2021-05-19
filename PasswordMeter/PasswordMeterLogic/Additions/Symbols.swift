//
//  Symbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Symbols: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSymbols();
        calculateBonusSymbol();
        calculateRequirementLevel();
    }
    
    func calculateCountOfSymbols() {
        let symbols = "(?=.*[!@#$&*])"
        
        password.forEach { character in
            if symbols.contains(character) {
                count += 1
            }
        }
    }

    func calculateBonusSymbol() {
        let bonusMultiplier = 6
        let haveSymbols = count > 0

        if haveSymbols {
            bonus = count * bonusMultiplier
        }
    }

    func calculateRequirementLevel() {
        if (count <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (count == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        Results(className: "Symbols", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
