//
//  SubscriptionTypeViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SubscriptionTypeViewModelTests: XCTestCase {
    var sut: SubscriptionTypeViewModel!
    
    override func setUp() {
        super.setUp()
        let path = Bundle(for: SubscriptionTests.self).path(forResource: "subscription_type", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let subscription = try! JSONDecoder().decode(SubscriptionType.self, from: data)
        sut = SubscriptionTypeViewModel(subscriptionType: subscription)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testId() {
        XCTAssertEqual(sut.id, "b4fa7ed0-69e3-4c77-a1d9-bdf0ca335352")
    }
    
    func testTitle() {
        XCTAssertEqual(sut.title, "Netflix")
    }
    
    func testImageUrl() {
        XCTAssertNil(sut.imageUrl)
    }
}
