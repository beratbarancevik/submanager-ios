//
//  SubscriptionSelectionControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SusbcriptionSelectionControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.navigationBars["home_navigation_bar".localized].buttons["add".localized].tap()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
    
    func testNavigationBarTitle() {
        let navigationBarTitle = app.navigationBars["subscription_selection_navigation_bar".localized].staticTexts["subscription_selection_title".localized]
        XCTAssert(navigationBarTitle.exists)
    }
    
    func testDismissBarButtonItem() {
        let dismissBarButtonItem = app.navigationBars["subscription_selection_navigation_bar".localized].buttons["dismiss".localized]
        XCTAssert(dismissBarButtonItem.exists)
        dismissBarButtonItem.tap()
        XCTAssertFalse(dismissBarButtonItem.exists)
    }
}
