//
//  Requirements.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Requirements: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE

    
    init(_ password: String) {
        self.password = password
        calculateCountOfRequirements()
        calculateBonusOfRequirements()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfRequirements() {
        let requirementsVariablesToCheck = AdditionsVariablesBuilder().getCountOfAllValuesForRequirementsCalculation(password)
        let minimumLength = 8
        
        for requirement in requirementsVariablesToCheck {
            let isClassNumberOfCharacters = requirement.className == "Number of Characters"
            let minimumValue = isClassNumberOfCharacters ? minimumLength : 1
            
            if (requirement.count == minimumValue) {
                count += 1
            } else if (requirement.count > minimumValue) {
                count += 1
            }
        }
    }
    
    private func calculateBonusOfRequirements() {
        let bonusMultiplier = 2
        let minimumLength = 8
        let numberMinimumOfRequiredChars = password.count >= minimumLength ? 3 : 4
        let satisfiesRequirements = count > numberMinimumOfRequiredChars
        
        if satisfiesRequirements {
            bonus = count * bonusMultiplier
        }
    }
    
    private func calculateRequirementLevel() {
        let minimumLength = 8
        let minimumNumberOfRequiredChars = password.count >= minimumLength ? 4 : 5

        if count == minimumNumberOfRequiredChars {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else if (count > minimumNumberOfRequiredChars) {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        } else {
            requirementLevel = RequirementLevel.FAILURE;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Requirements", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
