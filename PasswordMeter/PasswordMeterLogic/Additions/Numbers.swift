//
//  Numbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Numbers: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfNumbers();
        calculateBonusNumber();
        calculateRequirementLevel();
    }
    
    func calculateCountOfNumbers() {

        loopClosure().loop(word: password) { character in
            if character.isNumber {
                count += 1
            }
        }
    }

    func calculateBonusNumber() {
        let isNotOnlyNumbers = count < password.count
        let haveNumbers = count > 0
        let multiplicadorBonus = 4
        
        if (haveNumbers && isNotOnlyNumbers) {
            bonus = count * multiplicadorBonus
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
        Results(className: "Numbers", count: count, bonus: bonus, requirementLevel: requirementLevel!)
    }
}
