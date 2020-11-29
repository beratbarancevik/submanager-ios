//
//  PhotoLibraryManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class PhotoLibraryManagerTests: XCTestCase {
    var sut: PhotoLibraryManager!
    
    override func setUp() {
        super.setUp()
        sut = PhotoLibraryManager.shared
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
