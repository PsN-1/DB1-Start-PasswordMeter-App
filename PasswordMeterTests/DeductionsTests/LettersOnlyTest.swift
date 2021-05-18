//
//  LettersOnlyTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class LettersOnlyTest: XCTestCase {
    
    func testShouldReturnZeroLettersOnlyWithRequirementSufficient() {
        let result = LettersOnly("123456").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionLettersOnlyWithRequirementWarning() {
        let result = LettersOnly("asdasS").getResult()
        XCTAssertEqual(6, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
