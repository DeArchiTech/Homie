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
    var defaultDelegate : testDelegateOnComplete?
    
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
        self.defaultDelegate = testDelegateOnComplete(pmt :self)
        self.parseManager!.setDelegate(self.defaultDelegate!)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.testingForPass = true
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
        
        //1)Create a custom delegate to test this particular case
        class testGetUserOnComplete : BackEndCallCompleteProtocol{
            
            var pmt : ParseManagerTest?
            
            init(pmt : ParseManagerTest){
                
                self.pmt = pmt
                
            }
            
            func onNetworkSuccess(nsobject : NSObject){
                
                //Test Delegate Fired successfully
                XCTAssertNotNil(nsobject)
                let testingForPass = self.pmt?.testingForPass
                if testingForPass! {
                    
                    //1)Cast nsObject
                    //2)Check if nsobject has at least one element
                    
                }else{
                    
                    //1)Cast nsObject
                    //2)Check if nsobject has zero element;
                    
                }
                self.pmt?.expectation?.fulfill()
                
            }
            
            func onNetworkFailure(statusCode : Int , message : String) {
                
            }
            
        }
        
        //2)Set parsemanager 's delegate to this custom delegate
        let delegate = testGetUserOnComplete(pmt: self)
        self.parseManager?.setDelegate(delegate)
        
        //**Success Case set up
        
        var userID = "0NNK3ySSTl"
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get User Network Call")
        XCTAssertTrue(self.parseManager!.getUser(userID))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        userID = "0NNK3ySSTl" + "XYZ"
        self.testingForPass = false
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get User Network Call")
        
        //4)Do the right assertions for this case
        XCTAssertTrue(self.parseManager!.getUser(userID))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testGetTrendingItems(){
        
        //1)Create a custom delegate to test this particular case
        class testGetTrendingOnComplete : BackEndCallCompleteProtocol{
            
            var pmt : ParseManagerTest?
            
            init(pmt : ParseManagerTest){
                
                self.pmt = pmt
                
            }
            
            func onNetworkSuccess(nsobject : NSObject){
                
                //Test Delegate Fired successfully
                XCTAssertNotNil(nsobject)
                let testingForPass = self.pmt?.testingForPass
                if testingForPass! {
                    
                    //1)Cast nsObject
                    let array = nsobject as! NSArray
                    //2)Check if nsobject has at least one element
                    XCTAssert(array.count > 0)
                    
                }
                self.pmt?.expectation?.fulfill()
                
            }
            
            func onNetworkFailure(statusCode : Int , message : String) {
                
            }
            
        }
        
        //2)Set parsemanager 's delegate to this custom delegate
        let delegate = testGetTrendingOnComplete(pmt: self)
        self.parseManager?.setDelegate(delegate)

        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get Trending Items Network Call")
        XCTAssertTrue(self.parseManager!.getTrendingItems())
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testGetSearchResults(){
        
        //1)Create a custom delegate to test this particular case
        class testGetSearchOnComplete : BackEndCallCompleteProtocol{
            
            var pmt : ParseManagerTest?
            
            init(pmt : ParseManagerTest){
                
                self.pmt = pmt
                
            }
            
            func onNetworkSuccess(nsobject : NSObject){
                
                //Test Delegate Fired successfully
                XCTAssertNotNil(nsobject)
                let testingForPass = self.pmt?.testingForPass
                
                //1)Cast nsObject
                let array = nsobject as! NSArray
                
                if testingForPass! {

                    //2)Check if nsobject has at least one element
                    XCTAssert(array.count > 0)
                    
                }else{
                    
                    //2)Check if nsobject has no element
                    XCTAssert(array.count == 0)
                    
                }
                self.pmt?.expectation?.fulfill()
                
            }
            
            func onNetworkFailure(statusCode : Int , message : String) {
                
            }
            
        }
        
        //2)Set parsemanager 's delegate to this custom delegate
        let delegate = testGetSearchOnComplete(pmt: self)
        self.parseManager?.setDelegate(delegate)
        
        //**Success Case set up
        
        self.testingForPass = true
        
        var searchForm = SearchForm.init(
            name: "test" + utils.randomGenerator(),
            description: "testPass",
            pickUpPriceRangeLow: "0",
            pickUpPriceRangeHigh: "100",
            deliveryPriceRangeLow: "0",
            deliveryPriceRangeHigh: "100")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Search with Search Form as filter with > 0 results - Network Call")
        XCTAssertTrue(self.parseManager!.getSearchResults(searchForm))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        
        //**Failure Case set up
        
        self.testingForPass = false
        
        searchForm = SearchForm.init(
            name: "test" + utils.randomGenerator(),
            description: "testFailure",
            pickUpPriceRangeLow: "100",
            pickUpPriceRangeHigh: "0",
            deliveryPriceRangeLow: "100",
            deliveryPriceRangeHigh: "0")
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Search with JSON Object as filter - Network Call")
        XCTAssertTrue(self.parseManager!.getSearchResults(searchForm))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testPostItem(){
        
        //**Success Case set up
        
        let item = ItemModel()
        item.itemName = "test" + self.utils.randomGenerator() + " item"
        item.description = "test" + " description"
        item.pickUpPrice = 0.0
        item.deliveryPrice = 0.0
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Post Item Network Call")
        XCTAssertTrue(self.parseManager!.postItem(item))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
    func testPostImage(){
        
        //**Success Case set up
        
        let image = UIImage(named: "iconWallet.png")
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Post Image Network Call")
        XCTAssertTrue(self.parseManager!.postImage(image!))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)

    }
    
    
}
