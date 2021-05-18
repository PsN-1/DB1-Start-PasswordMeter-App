//
//  PasswordComplexityTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 18/05/21.
//

import XCTest
@testable import PasswordMeter

class PasswordComplexityTest: XCTestCase {

    func testShouldReturnVeryWeakWithZeroInput() {
        let result = PasswordComplexity(0).calculatePasswordComplexity()
        let expected = "Very Weak";
        XCTAssertEqual(expected, result)
    }

    func testShouldReturnVeryWeak() {
        let result = PasswordComplexity(14).calculatePasswordComplexity()
        let expected = "Very Weak";
        XCTAssertEqual(expected, result)
    }

    func testShouldReturnWeak() {
        let result = PasswordComplexity(32).calculatePasswordComplexity()
        let expected = "Weak";
        XCTAssertEqual(expected, result)
    }

    func testShouldReturnGood() {
        let result = PasswordComplexity(57).calculatePasswordComplexity()
        let expected = "Good";
        XCTAssertEqual(expected, result)
    }
    func testShouldReturnStrong() {
        let result = PasswordComplexity(71).calculatePasswordComplexity()
        let expected = "Strong";
        XCTAssertEqual(expected, result)
    }

    func testShouldReturnVeryStrong() {
        let result = PasswordComplexity(80).calculatePasswordComplexity()
        let expected = "Very Strong";
        XCTAssertEqual(expected, result)
    }
}
