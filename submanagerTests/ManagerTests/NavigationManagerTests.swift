//
//  NavigationManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class NavigationManagerTests: XCTestCase {
    var sut: NavigationManager!
    
    override func setUp() {
        super.setUp()
        sut = NavigationManager()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
