//
//  ViewController.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 22/05/21.
//

import Foundation

class ViewController {
    var password: String
    private var additions = [Results]()
    private var deductions = [Results]()
    private var score: Int = 0
    private var complexity: String = ""
    
    init(_ password: String) {
        self.password = password
        setUpValuesForResultView()
    }
    
    func setUpValuesForResultView() {
        let variablesCalculator = PasswordVariablesCalculator(password)
        
        additions = variablesCalculator.calculateAdditionsOfPasswordStrength()
        deductions = variablesCalculator.calculateDeductionsOfPasswordStrength()
        score = Score(password).getScore()
        complexity = PasswordComplexity(score).calculatePasswordComplexity()
    }
    
    func returnView() -> ResultsView{
        
        return ResultsView(
            password: password,
            resultsOfAdditions: additions,
            resultsOfDeductions: deductions,
            score: score,
            complexity: complexity
        )
    }
}
