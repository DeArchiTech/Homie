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

class MarketViewControllerTest: XCTestCase{
    
    var controller : MarketViewController?
    var model : DetailItemViewModel?
    let cell = MarketItemCell()
    let seller = MockBackendData().getUser()
    let itemName = "ItemName"
    var item : ItemModel?
    var array : NSMutableArray = []
    
    override func setUp() {
        
        super.setUp()
        self.array = NSMutableArray()
        self.item = ItemModel()
        self.item?.itemName = itemName
        self.controller = MarketViewController()
    
        self.controller?.detailItemViewModels = [DetailItemViewModel]()
        let itemToAppend = DetailItemViewModel(item: self.item!, seller: MockBackendData().getUser())
        self.controller?.detailItemViewModels.append(itemToAppend)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDataAction(){
        
        XCTAssertNotNil(self.controller!.getData(SearchForm()))
    
    }
}