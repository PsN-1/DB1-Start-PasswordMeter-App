//
//  NumbersOnly.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class NumbersOnly: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfNumbersOnly()
        calculateBonusOfNumbersOnly()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfNumbersOnly() {
        let numberOfCharacters = NumberOfCharacters(password).getResult().count
        
        if isNumbersOnly(){
            count = numberOfCharacters
        }
    }
    
    private func isNumbersOnly() -> Bool {
        var isNumbersOnly = true
        
        password.forEach { character in
            if !character.isNumber {
                isNumbersOnly = false
                return
            }
        }
        
        return isNumbersOnly
    }
    
    private func calculateBonusOfNumbersOnly() {
        bonus = count
    }
    
    private func calculateRequirementLevel() {
        if (count > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Numbers Only", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
