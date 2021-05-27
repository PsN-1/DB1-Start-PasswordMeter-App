//
//  LettersOnly.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class LettersOnly: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfLettersOnly()
        calculateBonusOfLettersOnly()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfLettersOnly() {
        let numberOfCharacters = NumberOfCharacters(password).getResult().count
        
        if isLettersOnly() {
            count = numberOfCharacters;
        }
    }
    
    private func isLettersOnly() -> Bool {
        var isLettersOnly = true
        
        password.forEach { character in
            if !character.isLetter {
                isLettersOnly = false
                return
            }
        }
        return isLettersOnly
    }
    
    private func calculateBonusOfLettersOnly() {
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
        return Results(className: "Letters Only", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
