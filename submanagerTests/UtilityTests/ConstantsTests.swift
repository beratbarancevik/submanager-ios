//
//  ConstantsTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class ConstantsTests: XCTestCase {
    var sut: Constants.Type!
    
    override func setUp() {
        super.setUp()
        sut = Constants.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testStaticImages() {
        XCTAssertEqual(sut.allCases.count, 4)
    }
}
