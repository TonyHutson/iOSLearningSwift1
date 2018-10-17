//
//  MathProblem.swift
//  iOSLearningSwift1
//
//  Created by Dwayne Hutson on 10/17/18.
//  Copyright © 2018 Tony Hutson. All rights reserved.
//
import Foundation

class MathProblem{
    
    var xNum: Int = 0
    var yNum: Int = 0
    
    // 0: Add, 1: Sub, 2: Mul, 3: Div
    // op must be defined as an optional since it is used to pass values between viewControllers via a Segue
    var op: Int?
    
    // This is a flag that can be set to prevent the user from answering the question and force a new problem to be presented (if we provide a way to show the answer for help)
    var requireNewProblem = false
    
    
    func doMath(first:Int, second:Int) -> Int{
        switch op {
        case 0:
            return first + second
        case 1:
            return first - second
        case 2:
            return first * second
        case 3:
            return first / second
        default:
            return 0
        }
    }
    
    func getProblem(min: Int, max: Int) -> (Int, Int){
        var notValid: Bool = true
        var x:UInt32 = 0
        var y:UInt32 = 0
        
        while notValid {
            x = arc4random_uniform(12)
            y = arc4random_uniform(12)
            
            switch op {
            case 0:
                notValid = false
            case 1:
                if x < y {
                    notValid = true
                } else {
                    notValid = false
                }
            case 2:
                notValid = false
            case 3:
                // Handle case where yNum is 0
                while y == 0{
                    y = arc4random_uniform(12)
                }
                
                x = x * y
                notValid = false
            default:
                print("This case should never happen")
            }
            requireNewProblem = false
        }
        return (Int(xNum),Int(yNum))
    }
}
