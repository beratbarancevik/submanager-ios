//
//  BaseControllerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class BaseControllerTests: XCTestCase {
    var sut: BaseController!
    
    override func setUp() {
        super.setUp()
        sut = BaseController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
