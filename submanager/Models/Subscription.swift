//
//  Subscription.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import CoreData

struct Subscription {
    var subId: String?
    var name: String?
    var price: Double?
    var startDate: Date?
    var interval: Int32?
    
    init(subId: String, name: String, price: Double, startDate: Date, interval: Int32) {
        self.subId = subId
        self.name = name
        self.price = price
        self.startDate = startDate
        self.interval = interval
    }
    
    init(managedObject: NSManagedObject) {
        subId = managedObject.value(forKey: CodingKeys.subId.rawValue) as? String
        name = managedObject.value(forKey: CodingKeys.name.rawValue) as? String
        price = managedObject.value(forKey: CodingKeys.price.rawValue) as? Double
        startDate = managedObject.value(forKey: CodingKeys.startDate.rawValue) as? Date
        interval = managedObject.value(forKey: CodingKeys.interval.rawValue) as? Int32
    }
    
    private enum CodingKeys: String, CodingKey {
        case subId
        case name
        case price
        case startDate
        case interval
    }
    
    func generateManagedObject(from managedObject: NSManagedObject) -> NSManagedObject {
        let newManagedObject = managedObject
        newManagedObject.setValue(subId, forKey: CodingKeys.subId.rawValue)
        newManagedObject.setValue(name, forKey: CodingKeys.name.rawValue)
        newManagedObject.setValue(price, forKey: CodingKeys.price.rawValue)
        newManagedObject.setValue(startDate, forKey: CodingKeys.startDate.rawValue)
        newManagedObject.setValue(interval, forKey: CodingKeys.interval.rawValue)
        return newManagedObject
    }
}
