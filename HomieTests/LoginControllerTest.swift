//
//  LoginControllerTest.swift
//  Homie
//
//  Created by davix on 10/7/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit
@testable import Homie

class LoginControllerTest: XCTestCase {

    var controller : LoginViewController?
    
    override func setUp() {
        super.setUp()
        self.controller = LoginViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoginAction() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //Test Succeed
        
        //1)Create Success form
        var form : LoginForm = LoginForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        //2)Call controller's sign up method with the form
        var result : Bool = self.controller!.loginAction(form)
        //3)Assert success by checking the result of the function call
        XCTAssertTrue(result)
        
        //Failure Cases
        
        //1)Create Failure form
        form = LoginForm(identifier: "~!@.com", password: "password")
        //2)Call controller's sign up method with the form
        result = self.controller!.loginAction(form)
        //3)Assert success by checking the result of the function call
        XCTAssertFalse(result)
        
        //1)Create Empty form
        form = LoginForm(identifier: "", password: "password")
        //2)Call controller's sign up method with the form
        result = self.controller!.loginAction(form)
        //3)Assert success by checking the result of the function call
        XCTAssertFalse(result)
    }

}
