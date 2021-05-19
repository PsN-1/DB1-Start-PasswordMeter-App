//
//  LettersOnly.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class LettersOnly: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfLettersOnly()
        calculateBonusOfLettersOnly()
        calculateRequirementLevel()
    }
    
    func calculateCountOfLettersOnly() {
        let numberOfCharacters = NumberOfCharacters(password).getResult().count
        
        if isLettersOnly() {
            count = numberOfCharacters;
        }
    }
    
    func isLettersOnly() -> Bool {
        var isLettersOnly = true
        
        loopClosure().loop(word: password) { character in
            if !character.isLetter {
                isLettersOnly = false
            }
        }
        
        return isLettersOnly
    }
    
    func calculateBonusOfLettersOnly() {
        bonus = count
    }
    
    func calculateRequirementLevel() {
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
