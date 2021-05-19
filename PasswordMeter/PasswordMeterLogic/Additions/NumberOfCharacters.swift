//
//  NumberOfCharacters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 13/05/21.
//

import Foundation

class NumberOfCharacters: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCount()
        calculateBonus()
        calculateRequirementLevel()
    }

    private func calculateCount() {
        count = password.count
    }
    
    private func calculateBonus() {
        let lengthMultiplier = 4
        let passwordLength = count
        bonus = passwordLength * lengthMultiplier
    }
    
    private func calculateRequirementLevel() {
        let minimumValue = 8
        let passwordLength = password.count
        
        if passwordLength == minimumValue {
            requirementLevel = RequirementLevel.SUFFICIENT
        } else if passwordLength > minimumValue {
            requirementLevel = RequirementLevel.EXCEPTIONAL
        } else {
            requirementLevel = RequirementLevel.FAILURE
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Number of Characters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
