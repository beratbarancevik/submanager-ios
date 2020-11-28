//
//  SplashViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SplashViewModelTests: XCTestCase {
    var sut: SplashViewModel!
    
    override func setUp() {
        super.setUp()
        sut = SplashViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
