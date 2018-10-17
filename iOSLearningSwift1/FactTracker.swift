//
//  FactTracker.swift
//  iOSLearningSwift1
//
//  Created by Dwayne Hutson on 10/16/18.
//  Copyright © 2018 Tony Hutson. All rights reserved.
//

import Foundation

class FactTracker {
    // Properties
    /*
     tryMatrix[x][y] - (stores the next try number)
     answerMatrix[x][y][try] (stores number correct - max 10 tries)
     reportMatrix[x][y] (stores percentage correct)
     */
    
    // tryMatrix is a 2d array that stores the next try for each math fact.
    //
    var tryMatrix = Array(repeating: Array(repeating: 0, count: 13), count: 13)
    
    // answerMatrix is a 3d array that stores if the answer is correct for each try
    // x-axis and y-axis are the match fact, z-axis is the result of the try (1 for correct, 0 for incorrect)
    //
    var answerMatrix = Array(repeating: Array(repeating: Array(repeating: 0, count: 10), count: 13), count: 13)
    
    // reportMatrix is a 2d array that stores the percentage of correct answers for the past 10 tries
    //
    var reportMatrix = Array(repeating: Array(repeating: 0.0, count: 13), count: 13)
    
    // Find Next Problem
    // Get the try# for the problem
    // Present Problem to User
    // Check the Problem
    // Update the try# for the problem
    // Update the answerMatrix
    // Update the reportMatrix
    
    // Methods
    
    // Given a math facts x and y, increment the try count by 1 (tries must be between 0 and 9 inclusive
    func incrementTry(xFact: UInt32, yFact: UInt32) {
        
        let x = Int(xFact)
        let y = Int(yFact)
        
        tryMatrix[x][y] = tryMatrix[x][y]+1
        if tryMatrix[x][y] > 9 {
            tryMatrix[x][y] = 0
        }
    }
    
    // get the next try number for a given math fact x and y
    func getTry(xFact: UInt32, yFact: UInt32) -> Int{
        let x = Int(xFact)
        let y = Int(yFact)
        return tryMatrix[x][y]
    }
    
    func logAnswer(xFact: UInt32, yFact: UInt32, tryNum: Int, result: Int){
        let x = Int(xFact)
        let y = Int(yFact)
        
        if result != 0 {
            answerMatrix[x][y][tryNum] = 1
        }
        else{
            answerMatrix[x][y][tryNum] = 0
        }
        
    }
    
    func updateReportMatrix(){
        var sum:Double = 0.0

        for x in 0...12{
            for y in 0...12{
                for z in 0...9{
                    sum = sum + Double(answerMatrix[x][y][z])
                }
                reportMatrix[x][y] = sum / 10.0
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
