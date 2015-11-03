//
//  LocationModelTest.swift
//  Homie
//
//  Created by davix on 11/2/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit
@testable import Homie

class LocationModelTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetDistrictName(){
        
        //SUCCESS CASE
        
        //Set up
        let correctDistrictName = "Webster Tower"
        var model = LocationModel(districtName : correctDistrictName)
        
        //Func
        
        let testValue = model.getDistrictName()
        
        //Assert
        
        XCTAssertEqual(correctDistrictName, testValue)
        
        //FAILURE CASE
        
        let incorrectDistrictName = "Incorrect District name"
        model = LocationModel(districtName: incorrectDistrictName)
        
        //Asssert
        
        XCTAssertNotEqual(model.getDistrictName() , correctDistrictName)
        
        
    }


}
