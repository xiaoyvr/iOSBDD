//
//  LoginUITests.swift
//  iOSBDDUITests
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginSuccessfully() {
        app.launch()
        inputUserName("John X")
        inputPassword("123456")
        
        app.buttons["Login"].tap()
        
        XCTAssert(app.staticTexts["Success"].exists)
    }
    
    func testLoginFaildByUserName() {
        app.launch()
        
        app.buttons["Login"].tap()
        
        XCTAssert(app.staticTexts["User Name Error"].exists)
    }
    
    func testLoginFaildByPassword() {
        app.launch()
        
        inputUserName("John X")
        app.buttons["Login"].tap()
        
        XCTAssert(app.staticTexts["Password Error"].exists)
    }
    
    private func inputUserName(_ userName: String) {
        let userNameTextField = app.textFields["userNameTextField"].firstMatch
        userNameTextField.tap()
        userNameTextField.typeText(userName)
    }
    
    private func inputPassword(_ password: String) {
        let passwordTextField = app.textFields["passwordTextField"].firstMatch
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }
}
