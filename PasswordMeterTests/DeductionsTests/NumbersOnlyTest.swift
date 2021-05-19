//
//  NumbersOnlyTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class NumbersOnlyTest: XCTestCase {

    func testShouldReturnZeroNumbersOnlyWithRequirementSufficient() {
        let result = NumbersOnly("asdasS").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionNumberOnlyWithRequirementWarning() {
        let result = NumbersOnly("123456").getResult()
        XCTAssertEqual(6, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
