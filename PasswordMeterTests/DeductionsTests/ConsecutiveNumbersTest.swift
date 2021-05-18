//
//  ConsecutiveNumbersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class ConsecutiveNumbersTest: XCTestCase {
    
    func testShouldReturnZeroWithRequirementSufficient() {
        let result = ConsecutiveNumbers("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionExpectedConsecutiveNumberWithRequirementWarning() {
        let result = ConsecutiveNumbers("asdfhjkiK4123*@^DFDS").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
