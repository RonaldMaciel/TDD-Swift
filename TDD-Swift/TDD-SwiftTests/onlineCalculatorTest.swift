//
//  onlineCalculatorTest.swift
//  TDD-Swift
//
//  Created by Ronald on 23/09/24.
//

import XCTest
@testable import TDD_Swift

class onlineCalculatorTest: XCTestCase {
    
    let onlineCalc = OnlineCalculatorBrain()
    
    // Testing Async calls to API
    func testRetiveURLFor10DividedBy2() {
        let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retriveURLForDivision(dividend: 10, divisor: 2)
        XCTAssert(url == response, "URL must be equals to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testRetiveURLFor10DividedBy2ShouldFail() {
        let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retriveURLForDivision(dividend: 20, divisor: 2)
        XCTAssert(url != response, "URL must be equals to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testCalculateDivisionOnlineFor10DividedBy2ShouldBe5() {
        onlineCalc.calculateWithTwoNumbers(dividend: 10, divisor: 2) { (response, error) -> () in
            XCTAssert(response == 5, "Response should be 5 ")
        }
    }
    
    func testCalculateDivisionByZero() {
        
        let expectation = expectation(description: "Expected callback from API fail")
        onlineCalc.calculateWithTwoNumbers(dividend: 10, divisor: 0) { (response, error) -> () in
            if error == nil {
                XCTFail()
            } else {
                XCTAssert(error?.domain == "Division by Zero", "Response should be 'Division by Zero'")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
}
