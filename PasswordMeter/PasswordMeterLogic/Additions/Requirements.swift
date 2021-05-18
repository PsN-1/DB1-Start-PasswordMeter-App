//
//  Requirements.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Requirements: AnalysisResult {
    var password: String
    private var countRequirements: Int = 0
    private var bonusRequirements: Int = 0
    private var requirementLevel: RequirementLevel? = RequirementLevel.EXCEPTIONAL

    
    init(_ password: String) {
        self.password = password
        calculateCountOfRequirements()
        calculateBonusOfRequirements()
        calculateRequirementLevel()
    }
    
    func calculateCountOfRequirements() {
        let arrayOfRequirementsVariables = AdditionsVariablesBuilder().getCountOfAllValuesForRequirementsCalculation(password)
        let minimumLength = 8
        
        for requirement in arrayOfRequirementsVariables {
            let minimumValue = requirement.className == "NumberOfCharacters" ? (minimumLength) : 1
            
            if (requirement.count == minimumValue) {
                countRequirements += 1
            } else if (requirement.count > minimumValue) {
                countRequirements += 1
            }
        }
    }
    
    func calculateBonusOfRequirements() {
        let multiplier = 2
        let minimumLength = 8
        let numberMinimumOfRequiredChars = password.count >= minimumLength ? 3 : 4

        if (countRequirements > numberMinimumOfRequiredChars) {
            bonusRequirements = countRequirements * multiplier
        }
    }
    
    func calculateRequirementLevel() {
        let minimumLength = 8
        let numberMinimumOfRequiredChars = password.count >= minimumLength ? 4 : 5

        if (countRequirements == numberMinimumOfRequiredChars) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else if (countRequirements > numberMinimumOfRequiredChars) {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        } else {
            requirementLevel = RequirementLevel.FAILURE;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Requirements", count: countRequirements, bonus: bonusRequirements, requirementLevel: requirementLevel!)
    }
}
