//
//  SignUpControllerTest.swift
//  Homie
//
//  Created by davix on 10/22/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
import UIKit
@testable import Homie

class SignUpControllerTest: XCTestCase {
    
    var controller : SignUpViewController?
    
    override func setUp() {
        super.setUp()
        self.controller = SignUpViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignUpAction(){
        
        //Test Succeed

        //1)Create Success form
        var form : SignUpForm = SignUpForm(identifier: Utils().randomGenerator(), password: "password")
        //2)Call controller's sign up method with the form
        var result : Bool = self.controller!.signUpAction(form)
        //3)Assert success by checking the result of the function call
        XCTAssertTrue(result)
    
        //Test fail (can't test this case until we figured out asyn testing

        /*
        //1)Create Fail form
        form = SignUpForm(identifier: "superUser", password: "password")
        //2)Call controller's sign up method with the form
        result = self.controller!.signUpAction(form)
        //3)Assert failure by checking the result of the function call
        XCTAssertFalse(result)
        */
        
    }
    
}