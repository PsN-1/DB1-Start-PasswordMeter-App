//
//  ConsecutiveUppercaseLetters.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class ConsecutiveUppercaseLetters: AnalysisResult {
    var password: String
    private var countConsecutiveUppercaseLetters: Int = 0
    private var bonusConsecutiveUppercaseLetters: Int = 0
    private var nTmpAlphaUC: Int? = nil
    private var requirementLevel: RequirementLevel?
    
    init(_ password: String) {
        self.password = password
        calculateCountOfConsecutiveUpperCaseLetters()
        calculateBonusOfConsecutiveUpperCaseLetters()
        calculateRequirementLevel()
    }
    
    func calculateCountOfConsecutiveUpperCaseLetters() {
        let arrayOfLetters: [Character] = Array(password)
        
        for i in 0..<arrayOfLetters.count {
            if arrayOfLetters[i].isUppercase && arrayOfLetters[i].isLetter {
                if (nTmpAlphaUC != nil) {
                    if (nTmpAlphaUC! + 1 == i) {
                        countConsecutiveUppercaseLetters += 1
                    }
                }
                nTmpAlphaUC = i
            }
        }
    }
    
    func calculateBonusOfConsecutiveUpperCaseLetters() {
        if (countConsecutiveUppercaseLetters > 0) {
            let multiplierConsecutiveAlphaUC = 2
            bonusConsecutiveUppercaseLetters = countConsecutiveUppercaseLetters * multiplierConsecutiveAlphaUC;
        }
    }
    
    func calculateRequirementLevel() {
        if (countConsecutiveUppercaseLetters > 0) {
            requirementLevel = RequirementLevel.WARNING
        } else {
            requirementLevel = RequirementLevel.SUFFICIENT
        }
    }
    
    func getResult() -> Results {
        return Results(className: "ConsecutiveUppercaseLetters", count: countConsecutiveUppercaseLetters, bonus: bonusConsecutiveUppercaseLetters, requirementLevel: requirementLevel!)
    }
}
