//
//  RepeatCharacters.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class RepeatCharactersTest: XCTestCase {
    
    func testShouldReturnZeroWithRequirementSufficient() {
        let result = RepeatCharacters("123").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnZeroWithRequirementSufficient2() {
        let result = RepeatCharacters("11").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(4, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
    func testShouldReturnDeductionRepeatedCharacterWithRequirementWarning() {
        let result = RepeatCharacters("asdasS").getResult()
        XCTAssertEqual(4, result.count)
        XCTAssertEqual(2, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
    func testShouldReturnDeductionExpectedRepeatedCharacterWithRequirementWarning() {
        let result = RepeatCharacters("asdfhjkiK4123*@^DFDS").getResult()
        XCTAssertEqual(2, result.count)
        XCTAssertEqual(1, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
    func testMain() {
        let result = RepeatCharacters("ssshdjksabcl").getResult()
        XCTAssertEqual(4, result.count)
        XCTAssertEqual(2, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
}
