//
//  NumberOfCharactersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 13/05/21.
//

import XCTest
@testable import PasswordMeter

class NumberOfCharactersTest: XCTestCase {
    func testExample() throws {
        let result = NumberOfCharacters("12345678").getResult()
        XCTAssertEqual(8, result.count)
        XCTAssertNotEqual(54, result.bonus)
        XCTAssertEqual(32, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() throws {
        let result = NumberOfCharacters("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)

    }

    func testShouldReturnExpectedValuesWithPasswordWithCharacters() throws {
        let result = NumberOfCharacters("1234567").getResult()
        XCTAssertEqual(7, result.count)
        XCTAssertEqual(28, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithCharactersAndRequirementSufficient() {
        let result = NumberOfCharacters("12345678").getResult()
        XCTAssertEqual(8, result.count)
        XCTAssertEqual(32, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithCharactersAndRequirementExceptional() {
        let result = NumberOfCharacters("123456789").getResult()
        XCTAssertEqual(9, result.count)
        XCTAssertEqual(36, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }
}
