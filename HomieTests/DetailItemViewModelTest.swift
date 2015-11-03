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

class DetailItemViewModelTest: XCTestCase {
    
    var model : DetailItemViewModel?
    let utils = Utils()
    
    let profileImage = "dummieProfileImage"
    let itemImage = "dummmieItemImage"
    let districtName = "dummieDistrictName"
    let itemName = "dummieItemName"
    let itemDescription = "dummieDescription"
    let district = "disctrictOne"
    let itemPhotos = ["photo1" , "photo2" , "photo3"]
    
    let pickUpPrice = 100.00
    let deliveryPrice = 200.00
    let data = MockBackendData()
    let itemModel = ItemModel()
    
    override func setUp() {
    
        super.setUp()
        self.model = itemModel
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetSellerProfileImage(){
        
        let profileImage = "ABCD"
        let userModel = UserModel(userInfo: self.data.getUser().userInfo, image : profileImage)
        itemModel.seller = userModel
        XCTAssertEqual(profileImage , self.model!.getSellerProfileImageUrl())
        
    }
    
    func testGetItemImage(){
        
        itemModel.photos = self.itemPhotos
        XCTAssertEqual(self.itemPhotos[0],self.model!.getItemImageUrl())
        
    }
    
    
    func testGetDistrictName(){
        
        let locModel = LocationModel(districtName: self.district)
        itemModel.locationModel = locModel
        XCTAssertEqual(self.district , self.model!.getDistrictName())
        
    }
    
    
    func testGetItemName(){
        
        itemModel.itemName = self.itemName
        XCTAssertEqual(self.itemName ,self.model!.getItemName())
        
    }
    
    
    func testGetItemDescription(){
        
        
        itemModel.description = self.itemDescription
        XCTAssertEqual(self.itemDescription , self.model!.getItemDescription())
        
    }
    
    
    func testGetPickUpPrice(){
        
        itemModel.pickUpPrice = self.pickUpPrice
        XCTAssertEqual(self.pickUpPrice ,self.model!.getPickUpPrice())
        
    }
    
    
    func testGetDeliveryPrice(){
        
        itemModel.deliveryPrice = self.deliveryPrice
        XCTAssertEqual(self.deliveryPrice ,self.model!.getDeliveryPrice())
        
    }
    
}