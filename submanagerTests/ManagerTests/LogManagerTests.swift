//
//  LogManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 12/5/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class LogManagerTests: XCTestCase {
    var sut: LogManager.Type!
    
    override func setUp() {
        super.setUp()
        sut = LogManager.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
