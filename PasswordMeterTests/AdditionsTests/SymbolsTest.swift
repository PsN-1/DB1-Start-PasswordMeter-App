//
//  SymbolsTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 16/05/21.
//

import XCTest
@testable import PasswordMeter

class SymbolsTest: XCTestCase {
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() {
        let result = Symbols("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithSymbolsRequirementExceptional() {
        var result = Symbols("1!)2as$DF").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(18, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
        
        result = Symbols("1@2as$DF").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(12, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithSymbolsRequirementSufficient() {
        let result = Symbols("12aS@dfas").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
}
