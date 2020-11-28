//
//  SubscriptionViewModelTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_try

import XCTest
@testable import SM_Debug

class SubscriptionViewModelTests: XCTestCase {
    var sut: SubscriptionViewModel!
    
    override func setUp() {
        super.setUp()
        let path = Bundle(for: SubscriptionTests.self).path(forResource: "subscription", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let subscription = try! JSONDecoder().decode(Subscription.self, from: data)
        sut = SubscriptionViewModel(subscription: subscription)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testId() {
        XCTAssertEqual(sut.id, "6ce05c46-6dca-4f4b-8abb-0367750657a7")
    }
    
    func testTitle() {
        XCTAssertEqual(sut.title, "Netflix")
    }
    
    func testDescription() {
        XCTAssertEqual(sut.description, "Netflix Premium HD Membership")
    }
    
    func testPrice() {
        XCTAssertEqual(sut.price, 17.99)
    }
    
    func testImageUrl() {
        XCTAssertNil(sut.imageUrl)
    }
}
