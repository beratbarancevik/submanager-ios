//
//  HomeControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import submanager

class HomeControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testNavigationBarTitle() {
        let navigationBarTitleExists = app.navigationBars["home_navigation_bar".localized].staticTexts["home".localized].exists
        XCTAssert(navigationBarTitleExists)
    }
    
    func testRightBarButtonItem() {
        let rightBarButtonItemExists = app.navigationBars["home_navigation_bar".localized].buttons["add".localized].exists
        XCTAssert(rightBarButtonItemExists)
    }
}
