//
//  MarketViewControllerTest.swift
//  Homie
//
//  Created by davix on 10/29/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit
@testable import Homie

class MarketViewControllerTest: XCTestCase {
    
    var controller : MarketViewController?
    
    override func setUp() {
        super.setUp()
        self.controller = MarketViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadItemCell(){
        
        let cell = MarketItemCell()
        let model : DetailItemViewModel = ItemModel()
        XCTAssertTrue(self.controller!.loadItemCell(cell, itemViewModel: model))
    }
    
    func testCreateItemViewModel(){
        
        let array = NSMutableArray()
        XCTAssertNotNil(self.controller?.createItemViewModel(0, itemArrary: array))
        
    }
}