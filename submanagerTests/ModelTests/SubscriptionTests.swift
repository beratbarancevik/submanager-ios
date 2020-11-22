//
//  SubscriptionTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_try

import XCTest
@testable import SM_Debug

class SubscriptionTests: XCTestCase {
    var sut: Subscription!
    
    func testInit() {
        let path = Bundle(for: SubscriptionTests.self).path(forResource: "subscription", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        sut = try! JSONDecoder().decode(Subscription.self, from: data)
        XCTAssertNotNil(sut)
    }
}
