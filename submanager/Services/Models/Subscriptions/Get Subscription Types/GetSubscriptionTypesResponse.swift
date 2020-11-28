//
//  GetSubscriptionTypesResponse.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

struct GetSubscriptionTypesResponse: Response {
    typealias T = [SubscriptionType]
    
    var code: String
    
    var message: String
    
    var data: T
}
