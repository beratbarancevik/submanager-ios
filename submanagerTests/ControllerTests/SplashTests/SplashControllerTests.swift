//
//  SplashControllerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SplashControllerTests: XCTestCase {
    var sut: SplashController!
    
    override func setUp() {
        super.setUp()
        sut = SplashController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
