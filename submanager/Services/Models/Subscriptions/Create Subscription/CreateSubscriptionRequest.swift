//
//  CreateSubscriptionRequest.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

class CreateSubscriptionRequest: Request {
    var path = ServiceConstants.subscriptions
    
    var method: HttpMethod = .post
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
    
    init(subscription: Subscription) {
        body = subscription.dictionary
    }
}
