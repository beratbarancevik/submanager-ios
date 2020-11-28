//
//  SubscriptionDetailViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SubscriptionDetailViewModelTests: XCTestCase {
    var sut: SubscriptionDetailViewModel!
    
    override func setUp() {
        super.setUp()
        sut = SubscriptionDetailViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
