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
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testNavigationBarTitle() {
        let navigationBarTitleExists = app.navigationBars["home_navigation_bar"].staticTexts["home".localized].exists
        XCTAssert(navigationBarTitleExists)
    }
}
