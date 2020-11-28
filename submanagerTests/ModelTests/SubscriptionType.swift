//
//  SubscriptionType.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import XCTest
@testable import SM_Debug

class SubscriptionTypeTests: XCTestCase {
    var sut: SubscriptionType!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        let path = Bundle(for: SubscriptionTests.self).path(forResource: "subscription_type", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        sut = try! JSONDecoder().decode(SubscriptionType.self, from: data)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.id, "b4fa7ed0-69e3-4c77-a1d9-bdf0ca335352")
        XCTAssertEqual(sut.title, "Netflix")
        XCTAssertEqual(sut.imageUrl, "")
    }
}
