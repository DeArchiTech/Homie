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
        var resultFirst = utils.randomGenerator()
        print(resultFirst)
        var resultSecond = utils.randomGenerator()
        print(resultSecond)
        //2)Check
        var sameString = (resultFirst == resultSecond)
        XCTAssertFalse(sameString)
    
    }
    
    func testValidIdentifier() {
        
        var validIndentifier : String = "david@gmail.com"
        XCTAssertTrue(self.utils.validIdentifier(validIndentifier))
        
        var invalidIndentifier : String = "~!@gmail.com"
        XCTAssertFalse(self.utils.validIdentifier(invalidIndentifier))
        
    }
    
    func testValidEmail() {
        
        var validIndentifier : String = "david@gmail.com"
        XCTAssertTrue(self.utils.validIdentifier(validIndentifier))
        
        var invalidIndentifier : String = "~!@gmail.com"
        XCTAssertFalse(self.utils.validIdentifier(invalidIndentifier))
        
    }
    
    func testValidPhoneNumber() {
        
        var validPhoneNumber : String = "4159605816"
        XCTAssertTrue(self.utils.validIdentifier(validPhoneNumber))
        
        var invalidPhoneNumber : String = "4159605816111"
        XCTAssertFalse(self.utils.validIdentifier(invalidPhoneNumber))
        
    }
    
    func testValidPassword() {
        
        var validPassword : String = "123456789"
        XCTAssertTrue(self.utils.validIdentifier(validPassword))
        
        var invalidPassword : String = "415"
        XCTAssertFalse(self.utils.validIdentifier(invalidPassword))
        
    }
    
}