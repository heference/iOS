//
//  ViewController.swift
//  Calculator
//
//  Created by Ikarious on 2016. 12. 26..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel?
    
    var userIsInTheMiddleOfTyping: Bool
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = display!.text!
        display!.text = textCurrentlyInDisplay + digit
        
        print("touched \(digit) digit")
    }
    
}

