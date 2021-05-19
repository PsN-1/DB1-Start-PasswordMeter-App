//
//  ConsecutiveLowercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveLowercaseLetters: AnalysisResult {
    var password: String
    private var countConsecutiveLowercaseLetters: Int = 0
    private var bonusConsecutiveLowercaseLetters: Int = 0
    private var nTmpAlphaLC: Int? = nil
    private var requirementLevel: RequirementLevel = RequirementLevel.FAILURE
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveLowerCaseLetters()
        calculateBonusOfConsecutiveLowerCaseLetters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfConsecutiveLowerCaseLetters() {
        let arrayOfLetters: [Character] = Array(password)
        
        for i in 0..<arrayOfLetters.count {
            if arrayOfLetters[i].isLowercase && arrayOfLetters[i].isLetter {
                if (nTmpAlphaLC != nil) {
                    if (nTmpAlphaLC! + 1 == i) {
                        countConsecutiveLowercaseLetters += 1
                    }
                }
                nTmpAlphaLC = i
            }
        }
    }
    
    func calculateBonusOfConsecutiveLowerCaseLetters() {
        if (countConsecutiveLowercaseLetters > 0) {
            let multiplierConsecutiveAlphaLC = 2
            bonusConsecutiveLowercaseLetters = countConsecutiveLowercaseLetters * multiplierConsecutiveAlphaLC;
        }
    }
    
    func calculateRequirementLevel() {
        if (countConsecutiveLowercaseLetters > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "Consecutive Lowercase Letters", count: countConsecutiveLowercaseLetters, bonus: bonusConsecutiveLowercaseLetters, requirementLevel: requirementLevel)
    }
}
