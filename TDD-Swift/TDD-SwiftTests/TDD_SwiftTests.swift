//
//  TDD_SwiftTests.swift
//  TDD-SwiftTests
//
//  Created by Ronald on 18/09/24.
//

import Testing
import XCTest
@testable import TDD_Swift

class TDD_SwiftTests: XCTestCase {

    let calculatorBrain = CalculatorBrain()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTenDivideBy5MustBe2() {
        let result = calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 5)
        XCTAssert(result == 2, "Result must be 2")
    }
    
    func testTenDivideByZeroMustBeNil() {
        let result = calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 0)
        XCTAssertNil(result, "Result must be nil")
    }
    
}
