//
//  Requirements.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class Requirements: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE

    
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
                count += 1
            } else if (requirement.count > minimumValue) {
                count += 1
            }
        }
    }
    
    func calculateBonusOfRequirements() {
        let bonusMultiplier = 2
        let minimumLength = 8
        let numberMinimumOfRequiredChars = password.count >= minimumLength ? 3 : 4
        let satisfiesRequirements = count > numberMinimumOfRequiredChars
        
        if satisfiesRequirements {
            bonus = count * bonusMultiplier
        }
    }
    
    func calculateRequirementLevel() {
        let minimumLength = 8
        let numberMinimumOfRequiredChars = password.count >= minimumLength ? 4 : 5

        if (count == numberMinimumOfRequiredChars) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else if (count > numberMinimumOfRequiredChars) {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        } else {
            requirementLevel = RequirementLevel.FAILURE;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Requirements", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
