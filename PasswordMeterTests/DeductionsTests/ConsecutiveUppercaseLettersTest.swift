//
//  ConsecutiveUppercaseLetters.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class ConsecutiveUppercaseLettersTest: XCTestCase {
    
    func testShouldReturnZeroWithRequirementSufficient() {
        let result = ConsecutiveUppercaseLetters("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionExpectedConsecutiveUpperCaseCharacterWithRequirementWarning() {
        let result = ConsecutiveUppercaseLetters("asdfhjkiK4123*@^DFDS").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(6, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
