//
//  ConsecutiveLowercaseLettersTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class ConsecutiveLowercaseLettersTest: XCTestCase {
    
    func testShouldReturnZeroWithRequirementSufficient() {
        let result = ConsecutiveLowercaseLetters("").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionExpectedConsecutiveLowerCaseCharacterWithRequirementWarning() {
        let result = ConsecutiveLowercaseLetters("asdfhjkiK4123*@^DFDS").getResult()
        XCTAssertEqual(7, result.count)
        XCTAssertEqual(14, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
