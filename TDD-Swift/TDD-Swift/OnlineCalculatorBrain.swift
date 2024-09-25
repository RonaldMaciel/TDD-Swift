//
//  OnlineCalculatorBrain.swift
//  TDD-Swift
//
//  Created by Ronald on 23/09/24.
//

import UIKit

class OnlineCalculatorBrain: NSObject {
    
    
    func retriveURLForDivision(dividend: Int, divisor: Int) -> URL {
        return URL(string:"https://www.calcatraz.com/calculator/api?c=\(dividend)%2F\(divisor)")!
    }
    
    func calculateWithTwoNumbers(dividend: Int, divisor: Int, completionHandler: @escaping (Float?, NSError?) -> () ) {
        let url = retriveURLForDivision(dividend: dividend, divisor: divisor)
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error == nil {
                if let data = data {
                    let sValue = NSString(data: data, encoding: NSUTF8StringEncoding)
                    completionHandler(sValue?.floatValue, nil)
                }
                let localError = NSError(domain: "Division by Zero", code: 1, userInfo: nil)
                return completionHandler(nil, localError)
            } else {
                print(error?.localizedDescription)
                return completionHandler(nil, error as NSError?)
            }
        }
        task.resume()
    }
    
}
