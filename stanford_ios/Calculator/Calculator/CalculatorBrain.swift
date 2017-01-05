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
 

//함수를 밖에 선언한 이유 : 클래스의 메소드가 아닌 전역함수로서 활용, 일종의 스타일이며 Scope를 Widly하게 사용하고 싶은 경우
//연산이 추가될 때마다 함수가 추가되어야 하기때문에 삭제
//func multiply(op1: Double, op2: Double) -> Double {
//    return op1 * op2
//}
 
//부모가 없다. 상속받은 것이 없다
class CalculatorBrain {
    
    //결과 누적 변수
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    //Code [D] Refactoring : Table 형태로 구현
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI), //M_PI
        "e" : Operation.Constant(M_E), //M_E
        "±" : Operation.UnaryOperation({ -$0 }),
        "√" : Operation.UnaryOperation(sqrt), //sqrt
        "cos" : Operation.UnaryOperation(cos), //cos
        //클로저 적용
        //Step1
//        "×" : Operation.BinaryOperation({ (op1: Double, op2: Double) -> Double in return op1 * op2}),
        //Step2 : Swift 타입추론 적용
//        "×" : Operation.BinaryOperation({ (op1, op2) in return op1 * op2}),
        //Step3 : 기본인자 활용
//        "×" : Operation.BinaryOperation({ ($0, $1) in return $0 * $1}),
        //Step4
//        "×" : Operation.BinaryOperation({ return $0 * $1}),
        //Step5 : Swift 타입추론
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
    ]
    
    //별개의 값을 모아놓은 세트 = 이넘클래스
    private enum Operation {
        case Constant(Double)
        //Swift는 Function이 타입의 형태로 쓰인다. 타입이 펑션이 될 수 있다.
        case UnaryOperation((Double) -> Double) //단항연산
        case BinaryOperation((Double, Double) -> Double) //이항연산
        case Equals
    }
    
    func performOperation(symbol: String) {
        
        if let operation = operations[symbol] {
            switch operation {
            //Operation.Constant 라고 하지 않는 이유는 Swift 가 타입을 추론하기 때문이다
            //연관값 사용
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
                //Default가 필요하지 않다 오직 Operation 타입은 오직 4가지 타입으로만 구성되어 있기 때문
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    //Optional Struct 인 이유
    //pendingBinaryOpertionInfo가 존재할 때만 의미있고 곱셈 나눗셈이 없는 경우에는 nil을 원할경우...
    //pending이 가지고 있는게 생기면 그때 set 해주면 된다
    private var pending: PendingBinaryOperationInfo?
    
    //Data Structure : Class, Enum, struct
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    //Read-Only
    var result: Double {
        get {
            return accumulator
        }
    }
}
