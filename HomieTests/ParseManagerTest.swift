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
        
        class loginTestDelegate : BackEndCallCompleteProtocol{
            
            
            func onNetworkSuccess(nsobject : NSObject){
                
                //Test Delegate Fired successfully
                XCTAssertNotNil(nsobject)
                
            }
            
            func onNetworkFailure(statusCode : Int , message : String) {
                
                //Test Delegate Fired successfully
                XCTAssertTrue(statusCode != 200)
                
            }
            
        }

        //Success Case
        let form = LoginForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        self.parseManager!.setDelegate(loginTestDelegate())
        
        //1)Test Function Fired successfully
        XCTAssertTrue(self.parseManager!.login(form))

        
        
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
