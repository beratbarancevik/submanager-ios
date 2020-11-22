//
//  AppDelegateTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import Firebase
import XCTest
@testable import SM_Debug

class AppDelegateTests: XCTestCase {
    var sut: UIApplicationDelegate!
    
    override func setUp() {
        super.setUp()
        sut = UIApplication.shared.delegate
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testAppDidFinishLaunchingWithOptions() {
        XCTAssertNotNil(sut as? AppDelegate)
        
        // Firebase
        XCTAssertNotNil(FirebaseApp.app())
        
        // AlamofireNetworkActivityIndicator
        XCTAssert(NetworkActivityIndicatorManager.shared.isEnabled)
    }
}
