//
//  SettingsViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SettingsViewModelTests: XCTestCase {
    var sut: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = SettingsViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
