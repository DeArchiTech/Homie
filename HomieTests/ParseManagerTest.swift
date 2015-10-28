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

class ParseManagerTest : XCTestCase {
    
    var parseManager : ParseManager?
    var expectation : XCTestExpectation?
    
    let utils = Utils()
    
    class testDelegateOnComplete : BackEndCallCompleteProtocol{
        
        var pmt : ParseManagerTest?
        
        init(pmt : ParseManagerTest){
            
            self.pmt = pmt
            
        }
        
        func onNetworkSuccess(nsobject : NSObject){
            
            //Test Delegate Fired successfully
            XCTAssertNotNil(nsobject)
            self.pmt?.expectation?.fulfill()
            
        }
        
        func onNetworkFailure(statusCode : Int , message : String) {
            
            //Test Delegate Fired successfully
            XCTAssertTrue(statusCode != 200)
            self.pmt?.expectation?.fulfill()
            
        }
        
    }

    override func setUp() {
        super.setUp()
        self.parseManager = ParseManager()
        self.parseManager!.setDelegate(testDelegateOnComplete(pmt :self))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        
        //**Success Case set up
        
        
        var form = LoginForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Login Network Call")
        XCTAssertTrue(self.parseManager!.login(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        
        form = LoginForm(identifier: "davidkakaman@gmail.com", password: "password")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Login Network Call")
        XCTAssertTrue(self.parseManager!.login(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testSignUp() {
     
        //**Success Case set up
        
        
        var form = SignUpForm(identifier: "test" + self.utils.randomGenerator(), password: "password")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Sign Up Network Call")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        
        form = SignUpForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Sign Up Network Call")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testGetUser(){
        
        let userID = "1"
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
