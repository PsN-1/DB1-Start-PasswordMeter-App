//
//  Calculate.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class PasswordVariablesCalculator {
    var password: String
    
    init(_ password: String) {
        self.password = password
    }
    
    func calculateAdditionsOfPasswordStrength() -> [Results] {
        var arrayOfAdditionsVariables = AdditionsVariablesBuilder().getCountOfAllValuesForRequirementsCalculation(password)
        
        arrayOfAdditionsVariables.append(MiddleNumbersOrSymbols(password).getResult())
        arrayOfAdditionsVariables.append(Requirements(password).getResult())
        
        return arrayOfAdditionsVariables
    }
    
    func calculateDeductionsOfPasswordStrength() -> [Results] {
        let arrayOfDeductionsVariables = DeductionsVariablesBuilderForScore().getCountOfAllDeductionValuesForScoreCalculator(password)
        
        return arrayOfDeductionsVariables
    }

}
