//
//  SequentialLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialLetters: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialLetters()
        calculateBonusOfSequentialLetters()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfSequentialLetters() {
        let letters = Array("abcdefghijklmnopqrstuvwxyz")
        let sizeOfGroup = 3
        
        for i in 0..<(letters.count - sizeOfGroup) {
            var groupOfLetters = ""
            for j in i ..< (i + sizeOfGroup) {
                groupOfLetters += "\(letters[j])"
            }
            let groupOfLettersReversed = String(groupOfLetters.reversed())
            
            if password.lowercased().contains(groupOfLetters) || password.lowercased().contains(groupOfLettersReversed) {
                count += 1
            }
        }
    }
    
    private func calculateBonusOfSequentialLetters() {
        let bonusMultiplier = 3
        if count > 0 {
            bonus = count * bonusMultiplier
        }
    }
    
    private func calculateRequirementLevel() {
        if count > 0 {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Sequential Letters", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
