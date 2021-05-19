//
//  Numbers.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Numbers: AnalysisResult {
    var password: String
    private var countNumber: Int = 0
    private var bonusNumber: Int = 0
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
                countNumber += 1
            }
        }
    }

    func calculateBonusNumber() {
        let isNotOnlyNumbers = countNumber < password.count
        let haveNumbers = countNumber > 0
        let multiplicadorBonus = 4
        
        if (haveNumbers && isNotOnlyNumbers) {
            bonusNumber = countNumber * multiplicadorBonus
        }
    }

    func calculateRequirementLevel() {
        if (countNumber <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (countNumber == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        Results(className: "Numbers", count: countNumber, bonus: bonusNumber, requirementLevel: requirementLevel!)
    }
}
