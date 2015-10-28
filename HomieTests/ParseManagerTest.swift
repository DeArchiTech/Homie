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
    var testingForPass : Bool = false
    
    let utils = Utils()
    
    class testDelegateOnComplete : BackEndCallCompleteProtocol{
        
        var pmt : ParseManagerTest?
        
        init(pmt : ParseManagerTest){
            
            self.pmt = pmt
            
        }
        
        func onNetworkSuccess(nsobject : NSObject){
            
            //Test Delegate Fired successfully
            XCTAssertNotNil(nsobject)
            let testingForPass = self.pmt?.testingForPass
            XCTAssert(testingForPass!)
            self.pmt?.expectation?.fulfill()
            
        }
        
        func onNetworkFailure(statusCode : Int , message : String) {
            
            //Test Delegate Fired successfully
            XCTAssertTrue(statusCode != 200)
            let testingForPass = self.pmt?.testingForPass
            XCTAssertFalse(testingForPass!)
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
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Login Network Call")
        XCTAssertTrue(self.parseManager!.login(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        
        form = LoginForm(identifier: "davidkakaman@gmail.com", password: "password")
        self.testingForPass = false
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Login Network Call")
        XCTAssertTrue(self.parseManager!.login(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testSignUp() {
     
        //**Success Case set up
        
        
        var form = SignUpForm(identifier: "test" + self.utils.randomGenerator(), password: "password")
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Sign Up Network Call")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        
        form = SignUpForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        self.testingForPass = false
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Sign Up Network Call")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testGetUser(){
        
        //**Success Case set up
        
        var userID = "0NNK3ySSTl"
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get User Network Call")
        XCTAssertTrue(self.parseManager!.getUser(userID))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        /*
        userID = "0NNK3ySSTl" + "XYZ"
        self.testingForPass = false
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get User Network Call")
        XCTAssertTrue(self.parseManager!.getUser(userID))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        */
        
        //TODO: Figure out how to recieve actural user objects from Parse Back End
        
    }
    
    func testGetTrendingItems(){
        
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get Trending Items Network Call")
        XCTAssertTrue(self.parseManager!.getTrendingItems())
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testGetSearchResults(){
        
        //**Success Case set up
        
        self.testingForPass = true
        let jsonObject = JSON(NSData())
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Search with JSON Object as filter - Network Call")
        XCTAssertTrue(self.parseManager!.getSearchResults(jsonObject))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testPostItem(){
        
        //**Success Case set up
        
        let item = ItemModel()
        item.name = "test" + self.utils.randomGenerator() + " item"
        item.description = "test" + " description"
        item.pickUpPrice = "test" + " Pick Up Price"
        item.deliveryPrice = "test" + " delivery Price"
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Post Item Network Call")
        XCTAssertTrue(self.parseManager!.postItem(item))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testPostImage(){
        
        //**Success Case set up
        
        let image = UIImage()
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Post Image Network Call")
        XCTAssertTrue(self.parseManager!.postImage(image))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)

    }
    
    
}
