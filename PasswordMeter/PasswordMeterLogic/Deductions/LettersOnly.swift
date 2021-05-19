//
//  LettersOnly.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class LettersOnly: AnalysisResult {
    var password: String
    private var countLettersOnly: Int = 0
    private var bonusLettersOnly: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfLettersOnly()
        calculateBonusOfLettersOnly()
        calculateRequirementLevel()
    }
    
    func calculateCountOfLettersOnly() {
        let arrayOfRequirementsVariables = DeductionsVariablesBuilder().getCountOfAllValuesForRequirementsCalculation(password)
        
        if (arrayOfRequirementsVariables["LowercaseLetters"]!.count > 0 || arrayOfRequirementsVariables["UppercaseLetters"]!.count > 0) && arrayOfRequirementsVariables["Symbols"]!.count == 0 && arrayOfRequirementsVariables["Numbers"]!.count == 0 {
            countLettersOnly = arrayOfRequirementsVariables["NumberOfCharacters"]!.count;
        }
    }
    
    func calculateBonusOfLettersOnly() {
        bonusLettersOnly = countLettersOnly
    }
    
    func calculateRequirementLevel() {
        if (countLettersOnly > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "LettersOnly", count: countLettersOnly, bonus: bonusLettersOnly, requirementLevel: requirementLevel)
    }
}
