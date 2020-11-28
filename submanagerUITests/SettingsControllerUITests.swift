//
//  SettingsControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SettingsControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.navigationBars["home_navigation_bar".localized].buttons["settings".localized].tap()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
    
    func testDismissBarButtonItem() {
        let dismissBarButtonItem = app.navigationBars["settings_navigation_bar".localized].buttons["dismiss".localized]
        XCTAssert(dismissBarButtonItem.exists)
        dismissBarButtonItem.tap()
        XCTAssertFalse(dismissBarButtonItem.exists)
    }
}
