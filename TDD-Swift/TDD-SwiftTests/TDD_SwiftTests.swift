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

    // Testing function
    func testTenDivideBy5MustBe2() {
       calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 5) { (result, error) -> Void in
            XCTAssert(result == 2, "Result must be 2")
        }
    }

    // Testing with errors
    func testTenDivideByZeroMustBeNil() {
        calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 0) { (result, error) -> Void in
            XCTAssertNil(result, "Result must be nil")
            XCTAssert(error?.domain == "Error dividing by Zero", "Error message should be 'Error diving by Zero'")
        }
    }
    
    // Testing a measure time function
    func testDivisionTime() {
        measure {
            self.calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 2, completionHandler: { (result,error) -> Void in
                // your code
            })
        }
    }

}
