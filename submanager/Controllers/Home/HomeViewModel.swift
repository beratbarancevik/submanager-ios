//
//  HomeViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class HomeViewModel {
    func getSubscriptions() {
        sendGetSubscriptionsRequest()
    }
}

// MARK: - Private Functions
private extension HomeViewModel {
    func sendGetSubscriptionsRequest() {
        SubscriptionsService.getSubscriptions { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                break
            }
        }
    }
}
