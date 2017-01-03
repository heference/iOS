 //
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ikarious on 2017. 1. 3..
//  Copyright © 2017년 heference. All rights reserved.
//

import Foundation

//부모가 없다. 상속받은 것이 없다
class CalculatorBrain {
    
    //결과 누적 변수
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        //switch 구문
        //swift 매우 중요한 구문 중 하나
        //switch의 대상이 되는 모든 경우의 수를 case로 고려해야 한다 ex) string의 경우 무한한 경우의 수이기 때문에 default를 통해 처리한다.
        //기본 코드 들여쓰기가 중요한 이유 : 코드를 읽는 사람이 좀더 쉽게 이해할 수 있기 때문이다.
        switch symbol {
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }
    
    //Read-Only
    var result: Double {
        get {
            return accumulator
        }
    }
}
