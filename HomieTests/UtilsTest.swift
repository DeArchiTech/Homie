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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRandomGenerator() {
        
        //1)Set up
        let utils = Utils()
        
        //2)Call Func
        var resultFirst = utils.randomGenerator()
        print(resultFirst)
        var resultSecond = utils.randomGenerator()
        print(resultSecond)
        //3)Check
        var sameString = (resultFirst == resultSecond)
        XCTAssertFalse(sameString)
    
    }
    
}