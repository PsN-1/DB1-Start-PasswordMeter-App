//
//  Symbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Symbols: AnalysisResult {
    var password: String
    private var countSymbol: Int = 0
    private var bonusSymbol: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSymbols();
        calculateBonusSymbol();
        calculateRequirementLevel();
    }
    
    func calculateCountOfSymbols() {
        let symbols = "(?=.*[!@#$&*])"
        
        loopClosure().loop(word: password) { character in
            if symbols.contains(character) {
                countSymbol += 1
            }
        }
    }

    func calculateBonusSymbol() {
        let bonusMultiplier = 6
        let haveSymbols = countSymbol > 0

        if haveSymbols {
            bonusSymbol = countSymbol * bonusMultiplier
        }
    }

    func calculateRequirementLevel() {
        if (countSymbol <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (countSymbol == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        Results(className: "Symbols", count: countSymbol, bonus: bonusSymbol, requirementLevel: requirementLevel!)
    }
}
