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
        self.model = DetailItemViewModel(item: self.item! , seller : self.seller)
        
        var users = [UserModel]()
        users.append(MockBackendData().getUser())
        
        var items = [ItemModel]()
        items.append(self.item!)
        
        self.controller?.items = items
        self.controller?.sellers = users

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testCreateItemViewModel(){
        
        //JUST CHECK ITEM'S NAME
        let item = self.controller?.createItemViewModel(0)
        XCTAssertEqual(self.itemName , item?.getItemName())
        
    }
}