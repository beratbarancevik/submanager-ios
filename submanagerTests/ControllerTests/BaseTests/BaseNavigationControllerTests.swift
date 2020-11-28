//
//  BaseNavigationControllerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class BaseNavigationControllerTests: XCTestCase {
    var sut: BaseNavigationController!
    
    override func setUp() {
        super.setUp()
        sut = BaseNavigationController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
