//
//  ViewController.swift
//  TDD-Swift
//
//  Created by Ronald on 18/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    let calculatorBrain: CalculatorBrain = CalculatorBrain()
    let calculatorOnline = OnlineCalculatorBrain()
    
    @IBOutlet weak var div1TextField: UITextField!
    @IBOutlet weak var div2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorOnline.calculateWithTwoNumbers(dividend: 10, divisor: 2) { (result: Float?, error: NSError?) -> () in
            print(error?.localizedDescription)
            
        }
    }

    @IBAction func calculateButton(_ sender: Any) {
        
    }
    
}

