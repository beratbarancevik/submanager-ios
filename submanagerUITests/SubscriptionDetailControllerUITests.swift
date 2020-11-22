//
//  SubscriptionDetailControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SubscriptionDetailControllerUITests: XCTestCase {
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
    
    func testLeftBarButtonItem() {
        let leftBarButtonItem = app.navigationBars["subscription_detail_navigation_bar".localized].buttons["dismiss".localized]
        XCTAssert(leftBarButtonItem.exists)
        leftBarButtonItem.tap()
        XCTAssertFalse(leftBarButtonItem.exists)
    }
}
