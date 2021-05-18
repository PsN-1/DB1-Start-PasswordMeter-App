//
//  DeductionsVariablesBuilderForScore.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 17/05/21.
//

import Foundation

class DeductionsVariablesBuilderForScore {
    func getCountOfAllDeductionValuesForScoreCalculator(_ password: String) -> [Results] {
        var results = [Results]()

        results.append(LettersOnly(password).getResult())
        results.append(NumbersOnly(password).getResult())
        results.append(RepeatCharacters(password).getResult())
        results.append(ConsecutiveUppercaseLetters(password).getResult())
        results.append(ConsecutiveLowercaseLetters(password).getResult())
        results.append(ConsecutiveNumbers(password).getResult())
        results.append(SequentialLetters(password).getResult())
        results.append(SequentialNumbers(password).getResult())
        results.append(SequentialSymbols(password).getResult())

        return results
    }
}
