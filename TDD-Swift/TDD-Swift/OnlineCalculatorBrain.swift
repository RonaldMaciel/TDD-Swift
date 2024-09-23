//
//  OnlineCalculatorBrain.swift
//  TDD-Swift
//
//  Created by Ronald on 23/09/24.
//

import UIKit

class OnlineCalculatorBrain: NSObject {
    
    
    func retiveURLForDivision(dividend: Int, divisor: Int) -> URL {
        return URL(string:"https://www.calcatraz.com/calculator/api?c=\(dividend)%2F\(divisor)")!
    }
    
    func calculateWithTwoNumbers(dividend: Int, divisor: Int, completionHandler: @escaping (Float?, Error?) -> () ){
        let url = retiveURLForDivision(dividend: dividend, divisor: divisor)
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error == nil {
                if let data = data {
                    let sValue = NSString(data: data, encoding: NSUTF8StringEncoding)
                    completionHandler(sValue?.floatValue, nil)
                }
                let localError = NSError(domain: "No data was found", code: 1, userInfo: nil)
                completionHandler(nil, localError)
            } else {
                print(error?.localizedDescription)
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
}
