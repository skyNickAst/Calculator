//
//  ViewController.swift
//  My Calculator
//
//  Created by Nikolai Astakhov on 06.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel.text! to Double")
            }
            return number
        }
        set {
            if String(newValue).hasSuffix(".0") {
                displayLabel.text = String(format: "%.0f", newValue)
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if displayLabel.text == "0," {
            displayLabel.text = "0"
        }
        
        if let result = calculator.calculate(symbol: sender.currentTitle!) {
            displayValue = result
            
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        let numValue = sender.currentTitle
        
        if isFinishedTypingNumber && numValue != "." {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else if isFinishedTypingNumber && numValue == "." {
            displayLabel.text! += numValue!
            isFinishedTypingNumber = false
        } else if displayLabel.text!.contains(".") && numValue == "." {
            return
        } else if displayLabel.text!.first == "0" && numValue == "." && displayLabel.text!.count == 2 {
            return
        } else if displayLabel.text!.first == "0" && numValue == "0" && displayLabel.text!.count == 1 {
            return
        } else if displayLabel.text!.first == "0" && numValue != "." && displayLabel.text!.count == 1 {
            displayLabel.text! = numValue!
        }
        else {
            displayLabel.text! += numValue!
        }
    }
    
}
