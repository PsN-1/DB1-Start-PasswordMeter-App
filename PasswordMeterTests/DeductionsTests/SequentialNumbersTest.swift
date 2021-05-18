//
//  SequentialNumbersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class SequentialNumbersTest: XCTestCase {
    
    func testShouldReturnZeroNumbersOnlyWithRequirementSufficient() {
        let result = SequentialNumbers("sdfghjkibcdK").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionSequentialNumbersWithRequirementWarning() {
        let result = SequentialNumbers("6612345456").getResult()
        XCTAssertEqual(4, result.count)
        XCTAssertEqual(12, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
}
