//
//  NumbersOnly.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class NumbersOnly: AnalysisResult {
    var password: String
    private var countOfNumbersOnly: Int = 0
    private var bonusOfNumbersOnly: Int = 0
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfNumbersOnly()
        calculateBonusOfNumbersOnly()
        calculateRequirementLevel()
    }
    
    func calculateCountOfNumbersOnly() {
        let arrayOfRequirementsVariables = DeductionsVariablesBuilder().getCountOfAllValuesForRequirementsCalculation(password)
        
        if (arrayOfRequirementsVariables["LowercaseLetters"]!.count == 0 && arrayOfRequirementsVariables["UppercaseLetters"]!.count == 0) && arrayOfRequirementsVariables["Symbols"]!.count == 0 && arrayOfRequirementsVariables["Numbers"]!.count > 0 {
            countOfNumbersOnly = arrayOfRequirementsVariables["NumberOfCharacters"]!.count
        }
    }
    
    func calculateBonusOfNumbersOnly() {
        bonusOfNumbersOnly = countOfNumbersOnly
    }
    
    func calculateRequirementLevel() {
        if (countOfNumbersOnly > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "NumbersOnly", count: countOfNumbersOnly, bonus: bonusOfNumbersOnly, requirementLevel: requirementLevel!)
    }
}
