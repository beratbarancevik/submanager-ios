//
//  SubscriptionsService.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class SubscriptionsService {
    // MARK: - Init
    private init() {}
    
    // MARK: - Requests
    static func getSubscriptions(completion: @escaping (Result<GetAllSubscriptionsResponse, Error>) -> Void) {
        let request = GetAllSubscriptionsRequest()
        ServiceManager.sendRequest(request, GetAllSubscriptionsResponse.self, completion: completion)
    }
    
    static func getSubscriptionTypes(completion: @escaping (Result<GetSubscriptionTypesResponse, Error>) -> Void) {
        let request = GetSubscriptionTypesRequest()
        ServiceManager.sendRequest(request, GetSubscriptionTypesResponse.self, completion: completion)
    }
}
