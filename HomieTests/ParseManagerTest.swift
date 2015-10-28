//
//  ParseManagerTest.swift
//  Homie
//
//  Created by davix on 10/23/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import Homie

class ParseManagerTest : XCTestCase{
    
    var parseManager : ParseManager?
    let utils = Utils()
    
    class ParseManagerTestDelegate : BackEndCallCompleteProtocol{
        
        func onNetworkSuccess(nsobject : NSObject){
            
        }
        func onNetworkFailure(statusCode : Int , message : String) {
            
        }
    }
    
    override func setUp() {
        super.setUp()
        self.parseManager = ParseManager()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        
        //Success Case
        let form = LoginForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        //1)Test Function Fired successfully
        XCTAssertTrue(self.parseManager!.login(form))
        //2)Test Delegate Fired successfully
        
    }
    
    func testSignUp() {
     
        let form = SignUpForm(identifier: self.utils.randomGenerator(), password: "password")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
    }
    
    func testGetUser(){
        
        let userID = 1
        XCTAssertTrue(self.parseManager!.getUser(userID))
        
    }
    
    func testGetTrendingItems(){
        
        XCTAssertTrue(self.parseManager!.getTrendingItems())
        
    }
    
    func testGetSearchResults(){
        
        let jsonObject = JSON(NSData())
        XCTAssertTrue(self.parseManager!.getSearchResults(jsonObject))
        
    }
    
    func testPostItem(){
        
        let item = ItemModel()
        XCTAssertTrue(self.parseManager!.postItem(item))
        
    }
    
    func testPostImage(){
        
        let image = UIImage()
        XCTAssertTrue(self.parseManager!.postImage(image))
    }
    
    
}
