//
//  SequentialSymbolsTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class SequentialSymbolsTest: XCTestCase {
    
    func testShouldReturnZeroNumbersOnlyWithRequirementSufficient() {
        let result = SequentialSymbols("asdasS").getResult()
        XCTAssertEqual(0, result.count)
        XCTAssertEqual(0, result.bonus)
        XCTAssertEqual(RequirementLevel.SUFFICIENT, result.requirementLevel)
    }

    func testShouldReturnDeductionSequentialSymbolsWithRequirementWarning() {
        let result = SequentialSymbols("66!@#@$@#$12*&^56").getResult()
        XCTAssertEqual(3, result.count)
        XCTAssertEqual(9, result.bonus)
        XCTAssertEqual(RequirementLevel.WARNING, result.requirementLevel)
    }
    
}
