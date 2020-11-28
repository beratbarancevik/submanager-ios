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
    static func createSubscription(completion: @escaping (Result<CreateSubscriptionResponse, Error>) -> Void) {
        let request = CreateSubscriptionRequest()
        ServiceManager.sendRequest(request, CreateSubscriptionResponse.self, completion: completion)
    }
    
    static func getSubscriptions(completion: @escaping (Result<GetAllSubscriptionsResponse, Error>) -> Void) {
        let request = GetAllSubscriptionsRequest()
        ServiceManager.sendRequest(request, GetAllSubscriptionsResponse.self, completion: completion)
    }
    
    static func getSubscriptionTypes(completion: @escaping (Result<GetSubscriptionTypesResponse, Error>) -> Void) {
        let request = GetSubscriptionTypesRequest()
        ServiceManager.sendRequest(request, GetSubscriptionTypesResponse.self, completion: completion)
    }
    
    static func deleteSubscription(subscriptionId: String, completion: @escaping (Result<DeleteSubscriptionResponse, Error>) -> Void) {
        let request = DeleteSubscriptionRequest(subscriptionId: subscriptionId)
        ServiceManager.sendRequest(request, DeleteSubscriptionResponse.self, completion: completion)
    }
    
    static func updateSubscription(completion: @escaping (Result<UpdateSubscriptionResponse, Error>) -> Void) {
        let request = UpdateSubscriptionRequest()
        ServiceManager.sendRequest(request, UpdateSubscriptionResponse.self, completion: completion)
    }
}
