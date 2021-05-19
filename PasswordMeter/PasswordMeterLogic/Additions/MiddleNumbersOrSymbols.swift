//
//  MiddleNumbersOrSymbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 16/05/21.
//

import Foundation

class MiddleNumbersOrSymbols: AnalysisResult {
    var password: String
    var countMidChar: Int = 0
    var bonusMidChar: Int = 0
    private var requirementLevel: RequirementLevel?
    
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
                    countMidChar += 1
            }
        }
    }
    
    func removeFirstAndLastCharacters(from password: String) -> String {
        let ignoreTheFirstLetter = password.dropFirst()
        let ignoreTheLastLetter = ignoreTheFirstLetter.dropLast()
        
        return String(ignoreTheLastLetter)
    }
    
    func calculateBonusMiddleCharacters(){
        let haveMiddleCharacters = countMidChar > 0
        let multiplierMidChar = 2

        if haveMiddleCharacters {
            bonusMidChar = countMidChar * multiplierMidChar
        }
    }
    
    func calculateRequirementLevel(){
        if (countMidChar <= 0 ) {
            requirementLevel = RequirementLevel.FAILURE;
        } else if (countMidChar == 1) {
            requirementLevel = RequirementLevel.SUFFICIENT;
        } else {
            requirementLevel = RequirementLevel.EXCEPTIONAL;
        }
    }
    
    func getResult() -> Results {
        return Results(className: "MiddleNumbersOrSymbols", count: countMidChar, bonus: bonusMidChar, requirementLevel: requirementLevel!)
    }
}
