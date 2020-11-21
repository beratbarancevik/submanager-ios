//
//  CoreDataManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import CoreData
import XCTest
@testable import SM_Debug

class CoreDataManagerTests: XCTestCase {
    var subscription: Subscription!
    
    override func setUp() {
        super.setUp()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        let startDate = dateFormatter.date(from: "15/10/2020")!
        subscription = Subscription(subId: "1", name: "Test Subscription", price: 9.99, startDate: startDate, interval: 30, managedObject: NSManagedObject())
    }
    
    override func tearDown() {
        super.tearDown()
        subscription = nil
    }
    
    func testContainerName() {
        XCTAssertEqual(Constants.coreDataSubsciptionsContainer, "Subscriptions")
    }
    
    func testSaveData() {
        CoreDataManager.shared.saveSubscription(subscription) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    func testReadData() {
        CoreDataManager.shared.getSubscriptions { result in
            switch result {
            case .success(let subscriptions):
                let subscription = subscriptions.first!
                XCTAssertEqual(subscription.subId, "1")
                XCTAssertEqual(subscription.name!, "Test Subscription")
                XCTAssertEqual(subscription.price!, 9.99)
                XCTAssertEqual(subscription.interval!, 30)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/mm/yyyy"
                let startDate = dateFormatter.date(from: "15/10/2020")
                XCTAssertEqual(subscription.startDate, startDate)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    func testDeleteData() {
        CoreDataManager.shared.deleteSubscription(subscription) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
}
