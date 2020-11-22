//
//  SplashControllerUITests.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SplashControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment.updateValue("YES", forKey: "ShouldStopAtSplash")
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        app = nil
    }
    
    func testLogoImageView() {
        let imageView = app.images["splash_logo_image_view".localized]
        XCTAssert(imageView.exists)
    }
}
