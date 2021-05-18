//
//  SequentialLettersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class SequentialLettersTest: XCTestCase {
    
    func testShouldReturnZeroNumbersOnlyWithRequirementSufficient() {
        let result = SequentialLetters("asdasS").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionSequentialLettersWithRequirementWarning() {
        let result = SequentialLetters("sdfghjkibcdK").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
    func testShouldReturnDeductionSequentialLettersWithRequirementWarning2() {
        let result = SequentialLetters("ABCshdjksal").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(3, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
