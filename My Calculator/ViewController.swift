//
//  ViewController.swift
//  My Calculator
//
//  Created by Nikolai Astakhov on 06.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if displayLabel.text == "0," {
            displayLabel.text = "0"
        }
        let number = Double(displayLabel.text!)!
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
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
