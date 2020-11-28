//
//  HomeControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class HomeControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
    
    func testNavigationBarTitle() {
        let navigationBarTitle = app.navigationBars["home_navigation_bar".localized].staticTexts["home".localized]
        XCTAssert(navigationBarTitle.exists)
    }
    
    func testRightBarButtonItem() {
        let rightBarButtonItem = app.navigationBars["home_navigation_bar".localized].buttons["add".localized]
        XCTAssert(rightBarButtonItem.exists)
    }
    
    func testSubscriptionsTableView() {
        let subscriptionsTableView = app.tables["home_subscriptions_table_view".localized]
        XCTAssert(subscriptionsTableView.exists)
        let subscriptionCell = subscriptionsTableView.cells.element(matching: .cell, identifier: String(describing: "SubscriptionCell"))
        XCTAssert(subscriptionCell.exists)
    }
}
