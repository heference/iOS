//
//  ViewController.swift
//  Calculator
//
//  Created by Ikarious on 2016. 12. 26..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

//private의 의미
//이 컨트롤러 내에서만 쓰이도록 하고싶다라는 뜻
//private 으로 우선 설정하고 추후 Public으로 설정하는 것이 좋은 방법이다. public -> private으로 접근영역을 줄여나가는 방법은 추후 사이드 이펙트를 일으킬 가능성이 매우 높은 코드다.

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    //Code [A] 리펙토링
    //Property
    //Display Value를 Get 할때는 Double 형태로
    //Display Value를 Set 할때는 String 형태로
    private var displayValue: Double {
        get {
            //Optional Value인 이유는 Double -> String 연산이 변환이 안될 수도 있기 때문이다 ex) Hello가 들어가는 경우 Crash가 발생하지만 여기서는 입력된 String이 숫자형태라고 확신이 되는 경우기 때문에 Optional을 Set 한다
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    //스위프트는 타입을 추론하기 때문에 추론이 가능한 상황 (초기화가 진행되었을때)이라면 가급적 변수의 타입을 지정하지 않는다
//    private var brain: CalculatorBrain = CalculatorBrain()
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(_ sender: UIButton) {
        //Code [C]
//        userIsInTheMiddleOfTyping = false
        
        //Code [C]
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        //이 코드들은 계산기의 실제 기능이 구현된 것이기 때문에 Controller 에 구현될 로직이 아니다. 계산기 자체의 정체성이 담겨있기 때문에 Model 객체로 옮겨야 한다
        if let mathematicalSymbol = sender.currentTitle {
            
            //Code [B] 리펙토링 : MVC 패턴 적용
            brain.performOperation(symbol: mathematicalSymbol)
            
            //Code [B]
//            if mathematicalSymbol == "π" {
////                Code [A]
////                display.text = String(M_PI) //M_PI
//                displayValue = M_PI
//            } else if mathematicalSymbol == "√" {
//                displayValue = sqrt(displayValue)
//            }
        }
        
        displayValue = brain.result
        
    }
}

