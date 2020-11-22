//
//  GetAllSubscriptionsRequest.swift
//  submanager
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class GetAllSubscriptionsRequest: Request {
    var path = ServiceConstants.subscriptions
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
}
