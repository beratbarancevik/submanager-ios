//
//  Subscription.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import CoreData

protocol CoreDataInterface {
    var managedObject: NSManagedObject { get set }
    init(managedObject: NSManagedObject)
    func generateManagedObject(from managedObject: NSManagedObject) -> NSManagedObject
}

struct Subscription: CoreDataInterface {
    var managedObject: NSManagedObject
    
    var subId: String?
    var name: String?
    var price: Double?
    var startDate: Date?
    var interval: Int32?
    
    init(subId: String, name: String, price: Double, startDate: Date, interval: Int32, managedObject: NSManagedObject) {
        self.subId = subId
        self.name = name
        self.price = price
        self.startDate = startDate
        self.interval = interval
        self.managedObject = managedObject
    }
    
    init(managedObject: NSManagedObject) {
        subId = managedObject.value(forKey: CodingKeys.subId.rawValue) as? String
        name = managedObject.value(forKey: CodingKeys.name.rawValue) as? String
        price = managedObject.value(forKey: CodingKeys.price.rawValue) as? Double
        startDate = managedObject.value(forKey: CodingKeys.startDate.rawValue) as? Date
        interval = managedObject.value(forKey: CodingKeys.interval.rawValue) as? Int32
        self.managedObject = managedObject
    }
    
    private enum CodingKeys: String, CodingKey {
        case subId
        case name
        case price
        case startDate
        case interval
    }
    
    func generateManagedObject(from managedObject: NSManagedObject) -> NSManagedObject {
        managedObject.setValue(subId, forKey: CodingKeys.subId.rawValue)
        managedObject.setValue(name, forKey: CodingKeys.name.rawValue)
        managedObject.setValue(price, forKey: CodingKeys.price.rawValue)
        managedObject.setValue(startDate, forKey: CodingKeys.startDate.rawValue)
        managedObject.setValue(interval, forKey: CodingKeys.interval.rawValue)
        return managedObject
    }
}
