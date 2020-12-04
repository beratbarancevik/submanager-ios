//
//  UpdateSubscriptionRequest.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class UpdateSubscriptionRequest: Request {
    var path = ServiceConstants.subscriptions
    
    var method: HttpMethod = .put
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
    
    init(subscription: Subscription) {
        self.path.append("/\(subscription.id ?? "")")
        body = subscription.dictionary
    }
}
