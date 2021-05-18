//
//  tests.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 16/05/21.
//


import XCTest
@testable import PasswordMeter

class UppercaseLettersTest: XCTestCase {
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() {
        let result = UppercaseLetters("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithUpperCaseLettersRequirementExceptional() {
        let result = UppercaseLetters("12asDF").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(8, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithUpperCaseLettersRequirementSufficient() {
        let result = UppercaseLetters("12aSdf").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(10, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
}
