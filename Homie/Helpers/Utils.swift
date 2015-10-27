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
    func randomGenerator() -> String {
        
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
        //Take on the range of 48 - 57, 65 -90 , 97 - 122
        
        //1)first Randomly generate a number from 0 to Max of the three intervals
        var n : Int?
        
        //2)Repeatly try to generate a rand number
        repeat{
            n = Int(arc4random_uniform(122))
        }
            
        //3)If number is in the ACSIIinterval, stop
        while self.inAlphaNumbericInterval(n!) == false
        
        //4)Convert ASCII Int to Chracter
        result = Character(UnicodeScalar(n!))
        return result
        
    }
    
    func inAlphaNumbericInterval(input : Int) -> Bool {
        
        var result = false
        
        //Three sets of ACSII intervals
        if (input >= 48 && input <= 57) || (input >= 65 && input <= 90) || (input >= 97 && input <= 122){
            result = true
        }
        
        return result
        
    }

    func validIdentifier(input : String) -> Bool {
        
        //Return valid email check
        return self.validEmail(input)
        
    }
    
    func validEmail(input : String) -> Bool {
        
        //check if there is a @ sign and than a . sign that comes after
        var result : Bool = false
        
        if input.characters.count >= 2 {
        
            //Outter loop: Scan for the first @ character
            outterLoop: for itr in 0 ... input.characters.count - 1 {
                
                let index = input.startIndex.advancedBy(itr)
                let firstChar = input[index]
                
                if "@" == firstChar {
                    
                    let innerItr = itr + 1
                    _ = input.startIndex.advancedBy(innerItr)
                    
                    //Inner loop: Scan for the first . character
                    innerLoop: for innerIndex in innerItr ... input.characters.count - 1 {
                        
                        let secondChar = input[input.startIndex.advancedBy(innerIndex)]
                        if secondChar == "."{
                            //Check if there is one more character after the dot
                            result = input.characters.count > innerIndex
                            break innerLoop
                        }
                        
                    }
                    
                }else{
                    
                    //Break loop and return false if we encounter any weird character
                    if self.validIdentifierCharacter(firstChar) == false {
                        break outterLoop
                    }
                    
                }
                
            }
            
        }
        
        return result
    
    }
    
    func validPhoneNumber(input : String) -> Bool {
        
        //check if there is at least 10 digits in the string
        var result : Bool = false
        
        //1)check if string has at least a length of 10
        if input.characters.count == 10{
            
            var count : Int = 0
            //2)Loop through the string and whenever we find a numeric, we add to the count
            for char in input.characters{
                
                let value : Int = Int(char.unicodeScalarsValue)
                let lowerBound : Int = Int("0".asciiValue)
                let uppderBound : Int = Int("9".asciiValue)
                
                if value >= lowerBound && value <= uppderBound {
                    
                    count++
                    
                }
                
            }
            result = count >= 10
            
        }
        
        //3)We assign the result to if the count is > 10 after we leave the loop
        
        return result
        
    }
    
    func validPassword(input : String) -> Bool {
     
        //check if the length is greater than five characters
        return input.characters.count >= 5
        
    }
    
    func validIdentifierCharacter(input : Character) -> Bool {
        
        //Conver input to its int equivalent and than call func
        let alphaNumericInput : Int = Int(input.unicodeScalarsValue)
        return self.inAlphaNumbericInterval(alphaNumericInput)
        
    }
    
}