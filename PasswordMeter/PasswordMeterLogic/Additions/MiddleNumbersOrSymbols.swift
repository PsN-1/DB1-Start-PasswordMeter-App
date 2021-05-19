//
//  MiddleNumbersOrSymbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class MiddleNumbersOrSymbols: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfMiddleCharacters()
        calculateBonusMiddleCharacters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfMiddleCharacters(){
        let symbols = "(?=.*[!@#$&%*^]`~;:{}),/|\\"
        let numbers = "1234567890"
        let middlePassword = removeFirstAndLastCharacters(from: password)

        loopClosure().loop(word: middlePassword) { character in
            if symbols.contains(character) || numbers.contains(character) {
                    count += 1
            }
        }
    }
    
    func removeFirstAndLastCharacters(from password: String) -> String {
        let ignoreTheFirstLetter = password.dropFirst()
        let ignoreTheLastLetter = ignoreTheFirstLetter.dropLast()
        
        return String(ignoreTheLastLetter)
    }
    
    func calculateBonusMiddleCharacters(){
        let haveMiddleCharacters = count > 0
        let multiplierMidChar = 2

        if haveMiddleCharacters {
            bonus = count * multiplierMidChar
        }
    }
    
    func calculateRequirementLevel(){
        if (count <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (count == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "MiddleNumbersOrSymbols", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
