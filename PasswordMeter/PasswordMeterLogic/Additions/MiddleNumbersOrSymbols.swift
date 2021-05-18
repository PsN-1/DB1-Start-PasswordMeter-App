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
        let arrayOfLetters: [Character] = Array(password)
        let passwordRegex = "(?=.*[!@#$&%*^]`~;:{}),/|\\"
        let numberRegex = "1234567890"

        for i in 0..<arrayOfLetters.count {
            if passwordRegex.contains(arrayOfLetters[i]) || numberRegex.contains(arrayOfLetters[i]) {
                if (i > 0 && i < arrayOfLetters.count - 1) {
                    countMidChar += 1
                }
            }
        }
        
    }
    
    func calculateBonusMiddleCharacters(){
        if (countMidChar > 0) {
            let multiplierMidChar = 2
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
