//
//  AuthenticationManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class AuthenticationManagerTests: XCTestCase {
    var sut: AuthenticationManager!
    
    override func setUp() {
        super.setUp()
        sut = AuthenticationManager.shared
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testAuthState() {
        XCTAssertEqual(AuthState.allCases.count, 3)
    }
}
