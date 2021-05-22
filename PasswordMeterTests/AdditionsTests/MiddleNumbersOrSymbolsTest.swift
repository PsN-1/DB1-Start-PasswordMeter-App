//
//  MiddleNumbersOrSymbolsTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 16/05/21.
//

import XCTest
@testable import PasswordMeter

class MiddleNumbersOrSymbolsTest: XCTestCase {
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() {
        let result = MiddleNumbersOrSymbols("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithMiddleNumberRequirementExceptional() {
        let result = MiddleNumbersOrSymbols("12@asDF!").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(4, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }

    func testShouldReturnExpectedValuesWithPasswordWithMiddleNumberRequirementSufficient() {
        let result = MiddleNumbersOrSymbols("12asDF!").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(2, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
    
    func test() {
        let result = MiddleNumbersOrSymbols("fbai3f27DG").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }
    
    func test2() {
        let result = MiddleNumbersOrSymbols("111").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(2, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
    
    func test3(){
        let result = MiddleNumbersOrSymbols("11").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }
    
    func test4(){
        let result = MiddleNumbersOrSymbols("1").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }
}
