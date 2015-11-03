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
        let userModel = UserModel(userInfo: self.data.getUser().userInfo, image : profileImage)
        let locModel = LocationModel(districtName: self.district)

        self.itemModel.photos = self.itemPhotos
        self.itemModel.itemName = self.itemName
        self.itemModel.description = self.itemDescription
        self.itemModel.pickUpPrice = self.pickUpPrice
        self.itemModel.deliveryPrice = self.deliveryPrice
        
        self.model = DetailItemViewModel(item : self.itemModel , seller : userModel)
        self.model!.locationModel = locModel
        self.model!.profileImage = self.profileImage
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetSellerProfileImage(){

        XCTAssertEqual(self.profileImage , self.model!.getSellerProfileImageUrl())
        
    }
    
    func testGetItemImage(){

        XCTAssertEqual(self.itemPhotos[0],self.model!.getItemImageUrl())
        
    }
    
    func testGetDistrictName(){

        XCTAssertEqual(self.district , self.model!.getDistrictName())
        
    }
    
    func testGetItemName(){
        
        XCTAssertEqual(self.itemName ,self.model!.getItemName())
        
    }
    
    func testGetItemDescription(){

        XCTAssertEqual(self.itemDescription , self.model!.getItemDescription())
        
    }
    
    func testGetPickUpPrice(){

        XCTAssertEqual(self.pickUpPrice ,self.model!.getPickUpPrice())
        
    }
    
    func testGetDeliveryPrice(){

        XCTAssertEqual(self.deliveryPrice ,self.model!.getDeliveryPrice())
        
    }
    
}