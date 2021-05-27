//
//  ConsecutiveLowercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveLowercaseLetters: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var indexOfLowercaseLetter: Int?
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveLowerCaseLetters()
        calculateBonusOfConsecutiveLowerCaseLetters()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfConsecutiveLowerCaseLetters() {
        let letters: [Character] = Array(password)
        
        for currentLetter in 0..<letters.count {
            if letters[currentLetter].isLowercase && letters[currentLetter].isLetter {
                if let indexOfPreviousLowercaseLetter = indexOfLowercaseLetter {
                    if (indexOfPreviousLowercaseLetter + 1 == currentLetter) {
                        count += 1
                    }
                }
                indexOfLowercaseLetter = currentLetter
            }
        }
    }
    
    private func calculateBonusOfConsecutiveLowerCaseLetters() {
        let bonusMultiplier = 2

        if count > 0 {
            bonus = count * bonusMultiplier
        }
    }
    
    private func calculateRequirementLevel() {
        if (count > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Consecutive Lowercase Letters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
