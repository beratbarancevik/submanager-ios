//
//  RealmManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/17/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class RealmManagerTests: XCTestCase {
    func testStartRealm() {
        do {
            try RealmManager.shared.startRealm()
            XCTAssert(true)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
}
