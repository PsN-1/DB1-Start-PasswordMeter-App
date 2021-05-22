//
//  ViewControllerTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 22/05/21.
//

import XCTest
@testable import PasswordMeter

class ViewControllerTest: XCTestCase {
    
    func testMain() {
        let result = ViewController("ssshdj@#$ksabcl").returnView()
        let expectedResultsOfAdditions = [
            PasswordMeter.Results(className: "Number of Characters", count: 15, bonus: 60, requirementLevel: PasswordMeter.RequirementLevel.EXCEPTIONAL),
            PasswordMeter.Results(className: "Uppercase Letters", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.FAILURE),
            PasswordMeter.Results(className: "Lowercase Letters", count: 12, bonus: 6, requirementLevel: PasswordMeter.RequirementLevel.EXCEPTIONAL),
            PasswordMeter.Results(className: "Numbers", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.FAILURE),
            PasswordMeter.Results(className: "Symbols", count: 3, bonus: 18, requirementLevel: PasswordMeter.RequirementLevel.EXCEPTIONAL),
            PasswordMeter.Results(className: "Middle Numbers or Symbols", count: 3, bonus: 6, requirementLevel: PasswordMeter.RequirementLevel.EXCEPTIONAL),
            PasswordMeter.Results(className: "Requirements", count: 3, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.FAILURE)
        ]
        let expectedResultsOfDeductions = [
            PasswordMeter.Results(className: "Letters Only", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.SUFFICIENT),
            PasswordMeter.Results(className: "Numbers Only", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.SUFFICIENT),
            PasswordMeter.Results(className: "Repeat Characters", count: 4, bonus: 1, requirementLevel: PasswordMeter.RequirementLevel.WARNING),
            PasswordMeter.Results(className: "Consecutive Uppercase Letters", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.SUFFICIENT),
            PasswordMeter.Results(className: "Consecutive Lowercase Letters", count: 10, bonus: 20, requirementLevel: PasswordMeter.RequirementLevel.WARNING),
            PasswordMeter.Results(className: "Consecutive Numbers", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.SUFFICIENT),
            PasswordMeter.Results(className: "Sequential Letters", count: 1, bonus: 3, requirementLevel: PasswordMeter.RequirementLevel.WARNING),
            PasswordMeter.Results(className: "Sequential Numbers", count: 0, bonus: 0, requirementLevel: PasswordMeter.RequirementLevel.SUFFICIENT),
            PasswordMeter.Results(className: "Sequential Numbers", count: 1, bonus: 3, requirementLevel: PasswordMeter.RequirementLevel.WARNING)]
        let expectedScore = 63
        let expectedComplexity = "Strong"
        
        XCTAssertEqual(expectedResultsOfAdditions, result.resultsOfAdditions)
        XCTAssertEqual(expectedResultsOfDeductions, result.resultsOfDeductions)
        XCTAssertEqual(expectedScore, result.score)
        XCTAssertEqual(expectedComplexity, result.complexity)
    }
}


