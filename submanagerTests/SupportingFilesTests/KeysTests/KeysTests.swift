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
    func testBaseUrl() {
        XCTAssertNotNil(URL(string: SecretConstants.baseUrl))
    }
}
