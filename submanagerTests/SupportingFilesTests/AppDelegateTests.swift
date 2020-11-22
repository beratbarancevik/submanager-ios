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
    var sut = UIApplication.shared.delegate
    
    func testAppDidFinishLaunchingWithOptions() {
        XCTAssertNotNil(sut as? AppDelegate)
        
        // Firebase
        XCTAssertNotNil(FirebaseApp.app())
        
        // AlamofireNetworkActivityIndicator
        XCTAssert(NetworkActivityIndicatorManager.shared.isEnabled)
    }
}
