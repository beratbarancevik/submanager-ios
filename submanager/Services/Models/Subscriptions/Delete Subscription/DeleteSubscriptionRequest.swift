//
//  DeleteSubscriptionRequest.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class DeleteSubscriptionRequest: Request {
    var path = ServiceConstants.subscriptions
    
    var method: HttpMethod = .delete
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
    
    init(subscriptionId: String) {
        self.path.append("/\(subscriptionId)")
    }
}
