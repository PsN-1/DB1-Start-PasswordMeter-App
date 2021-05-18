//
//  RequirementVariablesBuilder.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class AdditionsVariablesBuilder {
    func getCountOfAllValuesForRequirementsCalculation(_ password: String) -> [Results] {
        var results = [Results]()
        
        results.append(NumberOfCharacters(password).getResult())
        results.append(UppercaseLetters(password).getResult())
        results.append(LowercaseLetters(password).getResult())
        results.append(Numbers(password).getResult())
        results.append(Symbols(password).getResult())
        
        return results
    }
}
