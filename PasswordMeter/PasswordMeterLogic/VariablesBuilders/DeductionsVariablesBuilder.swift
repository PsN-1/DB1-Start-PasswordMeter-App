//
//  DeductionVariablesBuilder.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class DeductionsVariablesBuilder {
    func getCountOfAllValuesForRequirementsCalculation(_ password: String) -> [String: Results] {
        let results = [
            "NumberOfCharacters": NumberOfCharacters(password).getResult(),
            "UppercaseLetters": UppercaseLetters(password).getResult(),
            "LowercaseLetters": LowercaseLetters(password).getResult(),
            "Numbers": Numbers(password).getResult(),
            "Symbols": Symbols(password).getResult()
            ]
        
        return results
    }
}
