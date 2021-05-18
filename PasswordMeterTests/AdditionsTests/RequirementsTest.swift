//
//  RequirementsTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 16/05/21.
//

import XCTest
@testable import PasswordMeter

class RequirementsTest: XCTestCase {
    
    func testShouldReturnCorrectAmountOfRequirementsAndLevelFailure() {
        let result = Requirements("123456").getResult()
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.FAILURE, result.requirementLevel)
    }
    
    func testShouldReturnCorrectAmountOfRequirements2AndLevelExceptional() {
        let result = Requirements("asdfhjkiK4123*@^DFDS").getResult()
        XCTAssertEqual(5, result.count)
        XCTAssertEqual(10, result.bonus)
        XCTAssertEqual(RequirementLevel.EXCEPTIONAL, result.requirementLevel)
    }
    
    func testShouldReturnCorrectAmountOfRequirements3AndLevelSufficient() {
        let result = Requirements("asdfhjkiK2").getResult()
        XCTAssertEqual(4, result.count)
        XCTAssertEqual(8, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }
}
