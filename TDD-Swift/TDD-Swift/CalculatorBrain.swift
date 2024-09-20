//
//  CalculatorBrain.swift
//  TDD-Swift
//
//  Created by Ronald on 20/09/24.
//

import UIKit

class CalculatorBrain: NSObject {
    
    func divideTwoNumbers(dividend: Int, divisor: Int) -> Float? {
        if divisor == 0 {
            return nil
        }
        return Float(dividend/divisor)
    }
    
}
