//
//  NotificationsTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 12/2/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class NotificationsTests: XCTestCase {
    var sut: Notifications.Type!
    
    override func setUp() {
        super.setUp()
        sut = Notifications.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testStaticImages() {
        sut.allCases.forEach {
            XCTAssertNotNil($0.name)
        }
    }
}
