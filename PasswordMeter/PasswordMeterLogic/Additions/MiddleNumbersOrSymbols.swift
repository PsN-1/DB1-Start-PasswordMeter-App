//
//  MiddleNumbersOrSymbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class MiddleNumbersOrSymbols: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfMiddleCharacters()
        calculateBonusMiddleCharacters()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfMiddleCharacters(){
        let symbols = "(?=.*[!@#$&%*^]`~;:{}),/|\\"
        let numbers = "1234567890"
        let middlePassword = removeFirstAndLastCharacters(from: password)

        middlePassword.forEach { character in
            if symbols.contains(character) || numbers.contains(character) {
                    count += 1
            }
        }
    }
    
    private func removeFirstAndLastCharacters(from password: String) -> String {
        let ignoreTheFirstLetter = password.dropFirst()
        let ignoreTheLastLetter = ignoreTheFirstLetter.dropLast()
        
        return String(ignoreTheLastLetter)
    }
    
    private func calculateBonusMiddleCharacters(){
        let haveMiddleCharacters = count > 0
        let multiplierMidChar = 2

        if haveMiddleCharacters {
            bonus = count * multiplierMidChar
        }
    }
    
    private func calculateRequirementLevel(){
        if (count <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (count == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Middle Numbers or Symbols", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
