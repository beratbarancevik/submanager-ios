//
//  DeleteSubscriptionResponse.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

struct DeleteSubscriptionResponse: Response {
    typealias T = Subscription
    
    var code: String
    
    var message: String
    
    var data: T
}
