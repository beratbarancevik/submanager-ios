//
//  SubscriptionsService.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class SubscriptionsService {
    static func getSubscriptions(completion: @escaping (Result<GetAllSubscriptionsResponse, Error>) -> Void) {
        let request = GetAllSubscriptionsRequest()
        ServiceManager.sendRequest(request, GetAllSubscriptionsResponse.self, completion: completion)
    }
}
