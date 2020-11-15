//
//  String+ExtensionsTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import submanager

class StringExtensionsTests: XCTestCase {
    func testLocalized() {
        XCTAssertEqual("app_name".localized, "Sub Manager")
    }
}
