//
//  ConsecutiveUppercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveUppercaseLetters: AnalysisResult {
    var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var indexOfUppercaseLetter: Int?
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveUpperCaseLetters()
        calculateBonusOfConsecutiveUpperCaseLetters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfConsecutiveUpperCaseLetters() {
        let letters: [Character] = Array(password)
        
        for currentLetter in 0..<letters.count {
            if letters[currentLetter].isUppercase && letters[currentLetter].isLetter {
                if let indexOfPreviousUppercaseLetter = indexOfUppercaseLetter {
                    if (indexOfPreviousUppercaseLetter + 1 == currentLetter) {
                        count += 1
                    }
                }
                indexOfUppercaseLetter = currentLetter
            }
        }
    }
    
    func calculateBonusOfConsecutiveUpperCaseLetters() {
        let bonusMultiplier = 2

        if count > 0 {
            bonus = count * bonusMultiplier
        }
    }
    
    func calculateRequirementLevel() {
        if (count > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Consecutive Uppercase Letters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
