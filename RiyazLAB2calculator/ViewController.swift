//
//  ViewController.swift
//  Riyaz2Test
//
//  Created by Riyaz12 on 26/03/17.
//  Copyright © 2017 Riyaz12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NhandleButtonPress(_ sender: UIButton) {
        
        if canClear
        {
            displayLabel.text = ""
            canClear = false
        }
        
        let currentText = displayLabel.text!
        let textLabel = sender.titleLabel?.text
        
        if let text = textLabel
        {
            switch text
            {
            case "+", "*", "÷", "-":
                
                if hasOp
                {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                displayLabel.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
//                displayLabel.text = "\(result)"
                
                
                func displayNumber(number: Double) {
                                        if number - Double(Int(number)) == 0 {
//                                            print("\(Int(number))")
                                            
                                            let pointobject = ("\(Int(number))")
                                            print(pointobject)
                                            displayLabel.text = pointobject
                                            
                                        } else {
//                                            print("\(number)")
                                            let nopointobj = ("\(number)")
                                            print(nopointobj)
                                            displayLabel.text = nopointobj

                                            
                                        }
                                    }
                displayNumber(number: Double(result))


                
                break
            default:
                if isFirstNumber
                {
                    firstNumberText = "\(firstNumberText)\(text)"
                }
                else {
                    
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                displayLabel.text = "\(currentText)\(text)"
                break;
            }
        }

    }

    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "÷":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
    
    @IBAction func clearLbl(_ sender: Any) {
        
        displayLabel.text = "0"

        
    }

}

