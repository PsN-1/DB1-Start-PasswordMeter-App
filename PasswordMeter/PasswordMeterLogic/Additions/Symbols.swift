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
        let arrayOfLetters: [Character] = Array(password)
        let passwordRegex = "(?=.*[!@#$&*])"
        for letter in arrayOfLetters {
            if passwordRegex.contains(letter) {
                countSymbol += 1
            }
        }
    }

    func calculateBonusSymbol() {
        if (countSymbol > 0) {
            let multiplierSymbol = 6;
            bonusSymbol = countSymbol * multiplierSymbol;
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
