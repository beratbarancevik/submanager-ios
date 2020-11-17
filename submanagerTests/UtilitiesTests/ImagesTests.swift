//
//  ImagesTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class ImagesTests: XCTestCase {
    func testStaticImages() {
        Images.allCases.forEach {
            XCTAssertNotNil($0.image)
        }
    }
}
