//
//  UtilsTest.swift
//  Homie
//
//  Created by davix on 10/22/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit

@testable import Homie

class UtilsTest : XCTestCase {

    let utils = Utils()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRandomGenerator() {
        
        //1)Call Func
        let resultFirst = utils.randomGenerator()
        print(resultFirst)
        let resultSecond = utils.randomGenerator()
        print(resultSecond)
        //2)Check
        let sameString = (resultFirst == resultSecond)
        XCTAssertFalse(sameString)
    
    }
    
    func testValidIdentifier() {
        
        let validIndentifier : String = "david@gmail.com"
        XCTAssertTrue(self.utils.validIdentifier(validIndentifier))
        
        let invalidIndentifier : String = "~!@gmail.com"
        XCTAssertFalse(self.utils.validIdentifier(invalidIndentifier))
        
    }
    
    func testValidEmail() {
        
        let validIndentifier : String = "david@gmail.com"
        XCTAssertTrue(self.utils.validIdentifier(validIndentifier))
        
        let invalidIndentifier : String = "~!@gmail.com"
        XCTAssertFalse(self.utils.validIdentifier(invalidIndentifier))
        
    }
    
    func testValidPhoneNumber() {
        
        let validPhoneNumber : String = "4159605816"
        XCTAssertTrue(self.utils.validPhoneNumber(validPhoneNumber))
        
        let invalidPhoneNumber : String = "4159605816111"
        XCTAssertFalse(self.utils.validPhoneNumber(invalidPhoneNumber))
        
    }
    
    func testValidPassword() {
        
        let validPassword : String = "123456789"
        XCTAssertTrue(self.utils.validPassword(validPassword))
        
        let invalidPassword : String = "415"
        XCTAssertFalse(self.utils.validPassword(invalidPassword))
        
    }
    
    
    func testValidIdentifierCharacter() {
        
        let validIdentifierChar : Character  = "A"
        XCTAssertTrue(self.utils.validIdentifierCharacter(validIdentifierChar))
        
        let invalidIdentifierChar : Character  = "~"
        XCTAssertFalse(self.utils.validIdentifierCharacter(invalidIdentifierChar))
        
    }
    
    
}