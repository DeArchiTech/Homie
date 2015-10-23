//
//  Util.swift
//  Homie
//
//  Created by davix on 10/22/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class Utils : NSObject{
    
    //Returns a String that is in between 5 to 12 characters with Alpha and numerics only
    func randomGenerator() -> String? {
        
        var result : String = ""
        
        //Contraints :  Needs to be evenly distributed across 5 - 12 characters
        //           :  Can not be an empty string or nil
        //           :  Can be computed in linear time
        
        //Given Func : (let diceRoll = Int(arc4random_uniform(7)))
        
        //Algorithm :
        //  1)First generate a number N between 5-12 includsive=
        let N = arc4random_uniform(12-5) + 5
        //  2)Loop through N Times
        
        for _ in 1...N {
            //      2i)During loop, generate a single Alpha/numeric character
            let char = ranAlphaNumCharGen()
            //      2i)Append that character to a result string that is outside the loop
            result.append(char)
        }
        
        //  3)Return result
        
        return result
    
    }
    
    func ranAlphaNumCharGen() -> Character {
        
        var result : Character
        
        //Notes : ACSII Keyboard has Alpha Numeric as [A-Z] && [a-z] && [0-9], so they
        //Take on the range of 0 - 9, 65 -90 , 97 - 122
        
        //1)first Randomly generate a number from 0 to Max of the three intervals
        var n : Int?
        
        //2)Repeatly try to generate a rand number
        repeat{
            n = Int(arc4random_uniform(122))
        }
            
        //3)If number is in the ACSIIinterval, stop
        while self.inACSIIinterval(n!)
        
        //4)Convert ASCII Int to Chracter
        result = Character(UnicodeScalar(n!))
        return result
        
    }
    
    func inACSIIinterval(input : Int) -> Bool {
        
        var result = false
        
        //Three sets of ACSII intervals
        if (input >= 0 && input <= 9) || (input >= 65 && input <= 90) || (input >= 97 && input <= 122){
            result = true
        }
        
        return result
        
    }
    
}