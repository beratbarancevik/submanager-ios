//
//  HomeViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testGetSubscriptions() {
        
    }
}
