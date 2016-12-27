//
//  ViewController.swift
//  Calculator
//
//  Created by Ikarious on 2016. 12. 26..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
    }
    
}

