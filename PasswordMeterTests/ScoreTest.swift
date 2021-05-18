//
//  ScoreTest.swift
//  PasswordMeterTests
//
//  Created by Pedro Neto on 17/05/21.
//

import XCTest
@testable import PasswordMeter

class ScoreTest: XCTestCase {
    
    func testShouldReturnZeroValuesWhenTestedWithEmptyPassword() {
        let result = Score("").getScore()
        XCTAssertEqual(0, result)
    }

    func testShouldReturnZeroValueToTestUnder0Score() {
        let result = Score("1111111").getScore()
        XCTAssertEqual(0, result)
    }
    
    func testShouldReturnExpectedScoreWithSequenceOfSymbols() {
        let result = Score("ssshdj@#$ksabcl").getScore()
        XCTAssertEqual(63, result)
    }
    
    func testShouldReturnExpectedScoreLowerUpperAndNumbers() {
        let result = Score("asdfhjkiK41").getScore()
        XCTAssertEqual(72, result)
    }
    func testShouldReturnExpectedScoreLowerUpperSymbolAndNumbers() {
        let result = Score("asdfhjkiK41@").getScore()
        XCTAssertEqual(90, result)
    }
}
