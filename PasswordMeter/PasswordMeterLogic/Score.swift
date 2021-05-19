//
//  Score.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class Score {
    var password: String
    private var score: Int = 0
    
    init(_ password: String) {
        self.password = password
        calculateScore()
    }
    
    func calculateScore() {
        let additions = PasswordVariablesCalculator(password).calculateAdditionsOfPasswordStrength()
        let deductions = PasswordVariablesCalculator(password).calculateDeductionsOfPasswordStrength()
        
        for value in additions {
            score += value.bonus
        }
        
        for value in deductions {
            score -= value.bonus
        }
        
        if (score > 100) {
            score = 100
        } else if (score < 0 ) {
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
