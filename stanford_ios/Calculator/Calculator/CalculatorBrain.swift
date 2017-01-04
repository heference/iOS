 //
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ikarious on 2017. 1. 3..
//  Copyright © 2017년 heference. All rights reserved.
//

import Foundation

//Optional은 어떤 원리인가
// enum Optional<T> {
//    case None
//    case Some<T>
// }
 
 
//부모가 없다. 상속받은 것이 없다
class CalculatorBrain {
    
    //결과 누적 변수
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    //Code [D] Refactoring : Table 형태로 구현
    var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI), //M_PI
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation(sqrt), //sqrt
        "cos" : Operation.UnaryOperation(cos) //cos
    ]
    
    //별개의 값을 모아놓은 세트 = 이넘클래스
    enum Operation {
        case Constant(Double)
        //Swift는 Function이 타입의 형태로 쓰인다. 타입이 펑션이 될 수 있다.
        case UnaryOperation((Double) -> Double) //단항연산
        case BinaryOperation //이항연산
        case Equals
    }
    
    func performOperation(symbol: String) {
        //switch 구문
        //swift 매우 중요한 구문 중 하나
        //switch의 대상이 되는 모든 경우의 수를 case로 고려해야 한다 ex) string의 경우 무한한 경우의 수이기 때문에 default를 통해 처리한다.
        //기본 코드 들여쓰기가 중요한 이유 : 코드를 읽는 사람이 좀더 쉽게 이해할 수 있기 때문이다.
        
        
        //Code [D] : case 문이 반복되어 코드의 반복이 많아질 가능성이 생긴다
//        switch symbol {
//        case "π": accumulator = M_PI
//        case "√": accumulator = sqrt(accumulator)
//        default: break
//        }
    //Code [D] Refactoring
        //Code [E]
//        let constant = operations[symbol]
//        accumulator = constant!
        //Optional을 안전하게 해제하는 코드는 다음과 같다
        //operations[symbol]의 타입은 옵셔널 더블이다. 왜냐하면 딕셔너리에 우리가 찾으려는 키가 없을 수도 있기 때문이다.

//        if let constant = operations[symbol] {
//            accumulator = constant
//        }
        
        if let operation = operations[symbol] {
            switch operation {
            //Operation.Constant 라고 하지 않는 이유는 Swift 가 타입을 추론하기 때문이다
            //연관값 사용
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation: break
            case .Equals: break
                //Default가 필요하지 않다 오직 Operation 타입은 오직 4가지 타입으로만 구성되어 있기 때문
            }
        }
    }
    
    //Read-Only
    var result: Double {
        get {
            return accumulator
        }
    }
}
