//
//  CalculatorBrain.swift
//  TDD-Swift
//
//  Created by Ronald on 20/09/24.
//

import UIKit

class CalculatorBrain: NSObject {
    
    func divideTwoNumbers(dividend: Int, divisor: Int, completionHandler: ((_ result: Float?, _ error: NSError?) -> Void)) {
        
        sleep(1)

        if divisor == 0 {
            let error = NSError(domain: "Error dividing by Zero", code: 1)
            return completionHandler(nil, error)
        }
        return completionHandler((Float(dividend/divisor)), nil)
    }
    
}
