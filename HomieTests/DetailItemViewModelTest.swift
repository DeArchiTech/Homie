//
//  ItemViewModelTest.swift
//  Homie
//
//  Created by davix on 10/29/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit
@testable import Homie

class DetailItemViewModelTest : XCTestCase{
    
    var model : DetailItemViewModel?
    
    override func setUp() {
        super.setUp()
        self.model = ItemModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetSellerProfileImage(){
        
        XCTAssertNotEqual("",self.model!.getSellerProfileImage())
        
    }
    
    func testGetItemImage(){
        
        XCTAssertNotEqual("",self.model!.getItemImage())
        
    }
    
    
    func testGetDistrictName(){
        
        XCTAssertNotEqual("",self.model!.getDistrictName())
        
    }
    
    
    func testGetItemName(){
        
        XCTAssertNotEqual("",self.model!.getItemName())
        
    }
    
    
    func testGetItemDescription(){
        
        XCTAssertNotEqual("",self.model!.getItemDescription())
        
    }
    
    
    func testGetPickUpPrice(){
        
        XCTAssertNotEqual("",self.model!.getPickUpPrice())
        
    }
    
    
    func testGetDeliveryPrice(){
        
        XCTAssertNotEqual("",self.model!.getDeliveryPrice())
        
    }
    
}