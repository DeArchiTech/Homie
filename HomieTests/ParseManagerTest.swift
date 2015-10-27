//
//  ParseManagerTest.swift
//  Homie
//
//  Created by davix on 10/23/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest
@testable import Homie

class ParseManagerTest : XCTestCase {
    
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
    
        let form = LoginForm(identifier: "davidkwokhochan@gmail.com", password: "password")
        XCTAssertTrue(self.parseManager!.login(form))
        
    }
    
    func testSignUp() {
     
        let form = SignUpForm(identifier: self.utils.randomGenerator(), password: "password")
        XCTAssertTrue(self.parseManager!.signUp(form))
        
    }
}
