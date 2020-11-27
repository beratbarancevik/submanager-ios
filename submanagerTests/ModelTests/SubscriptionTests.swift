//
//  SubscriptionTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SubscriptionTests: XCTestCase {
    var sut: Subscription!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        let path = Bundle(for: SubscriptionTests.self).path(forResource: "subscription", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        sut = try! JSONDecoder().decode(Subscription.self, from: data)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.id, "6ce05c46-6dca-4f4b-8abb-0367750657a7")
        XCTAssertEqual(sut.title, "Netflix")
        XCTAssertEqual(sut.description, "Netflix Premium HD Membership")
        XCTAssertEqual(sut.price, "17.99")
        XCTAssertNil(sut.startDate)
    }
}
