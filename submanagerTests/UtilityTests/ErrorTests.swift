//
//  ErrorTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class ErrorTests: XCTestCase {
    var sut: GenericError.Type!
    
    override func setUp() {
        super.setUp()
        sut = GenericError.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testStaticImages() {
        XCTAssertEqual(sut.allCases.count, 3)
    }
}
