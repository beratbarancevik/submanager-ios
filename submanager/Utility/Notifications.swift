//
//  Notifications.swift
//  submanager
//
//  Created by Berat Cevik on 12/2/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

enum Notifications: String, CaseIterable {
    case shouldUpdateSubscriptions
    
    var name: Notification.Name {
        return Notification.Name(self.rawValue)
    }
}
