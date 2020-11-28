//
//  GetSubscriptionTypesRequest.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class GetSubscriptionTypesRequest: Request {
    var path = ServiceConstants.subscriptionTypes
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
}
