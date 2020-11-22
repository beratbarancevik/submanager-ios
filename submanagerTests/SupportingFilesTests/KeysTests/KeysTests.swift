//
//  KeysTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class KeysTests: XCTestCase {
    var sut: SecretConstants.Type!
    
    override func setUp() {
        super.setUp()
        sut = SecretConstants.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testBaseUrl() {
        XCTAssertNotNil(URL(string: sut.baseUrl))
    }
}
