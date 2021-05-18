//
//  NumbersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 16/05/21.
//

import XCTest
@testable import PasswordMeter

class NumbersTest: XCTestCase {
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() {
        let result = Numbers("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }

    func shouldReturnExpectedValuesWithPasswordWithNumbersRequirementExceptional() {
        let result = Numbers("12asDF").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(12, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }

    func shouldReturnExpectedValuesWithPasswordWithNumbersRequirementSufficient() {
        let result = Numbers("1aSdf").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(4, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
}
