//
//  HomieUITests.swift
//  HomieUITests
//
//  Created by davix on 10/3/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import XCTest

class HomieUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignUpLabel() {
    
        //1)Create Query Manager
        let app = XCUIApplication()
        
        //2)Assert That state is disabled
        XCTAssert(app.buttons["Sign Me Up!"].exists == false)
        
        //3)Trigger Function or action
        app.buttons["Sign Up"].tap()
        
        //4)Assert That state is enabled
        XCTAssert(app.buttons["Sign Me Up!"].exists)

    }
    
    func testLoginButton() {
        
        //1)Create Query Manager
        let app = XCUIApplication()
        
        //2)Assert That state is disabled
        var tabBarsCount = app.tabBars.count
        XCTAssert(tabBarsCount == 0)
        
        //3)Trigger Function or action
        
        let identifierTextField = app.textFields["Identifier"]
        identifierTextField.tap()
        identifierTextField.typeText("davix1013")
        app.toolbars.buttons["Done"].tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        
        if passwordSecureTextField.exists {
            passwordSecureTextField.tap()
            passwordSecureTextField.typeText("password")
            app.toolbars.buttons["Done"].tap()
        }
        
        app.buttons["Take Me Home!"].tap()
        
        //4)Assert That state is enabled
        tabBarsCount = app.tabBars.count
        XCTAssert(tabBarsCount == 1)
        
    }
    
    func testSignUpButton(){
        
        //1)Create Query Manager
        let app = XCUIApplication()
        
        //2)Assert That state is disabled
        
        //3)Trigger Function or action
        
        //4)Assert That state is enabled

    }
    
}
