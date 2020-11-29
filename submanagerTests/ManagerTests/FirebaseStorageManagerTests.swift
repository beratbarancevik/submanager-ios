//
//  FirebaseStorageManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class FirebaseStorageManagerTests: XCTestCase {
    var sut: FirebaseStorageManager!
    
    override func setUp() {
        super.setUp()
        sut = FirebaseStorageManager()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
