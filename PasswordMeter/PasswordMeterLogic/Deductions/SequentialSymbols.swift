//
//  SequentialSymbols.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class SequentialSymbols: AnalysisResult {
    internal var password: String
    private var count: Int = 0
    private var bonus: Int = 0
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfSequentialSymbols()
        calculateBonusOfSequentialSymbols()
        calculateRequirementLevel()
    }
    
    private func calculateCountOfSequentialSymbols() {
        let symbols = Array(")!@#$%^&*()")
        let sizeOfGroup = 3
        
        for i in 0..<(symbols.count - sizeOfGroup) {
            var groupOfCharacters = ""
            for j in i ..< (i + sizeOfGroup) {
                groupOfCharacters += "\(symbols[j])"
            }
            let groupOfCharactersReversed = String(groupOfCharacters.reversed())
            
            if password.lowercased().contains(groupOfCharacters) || password.lowercased().contains(groupOfCharactersReversed) {
                count += 1
            }
        }
    }
    
    private func calculateBonusOfSequentialSymbols() {
        let bonusMultipler = 3
        if count > 0 {
            bonus = count * bonusMultipler
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
        return Results(className: "Sequential Numbers", count: count, bonus: bonus, requirementLevel: requirementLevel)
    }
}
