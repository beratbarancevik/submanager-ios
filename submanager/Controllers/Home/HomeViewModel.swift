//
//  HomeViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift

class HomeViewModel: BaseControllerViewModel {
    // MARK: - Properties
    let didReceiveSubscriptions = PublishSubject<Bool>()
    let error = PublishSubject<Error>()
    let loading = PublishSubject<Bool>()
    
    var subscriptionViewModels = [SubscriptionViewModel]() {
        didSet {
            didReceiveSubscriptions.onNext(true)
        }
    }
    
    // MARK: - Functions
    func getSubscriptions() {
        sendGetSubscriptionsRequest()
    }
}

// MARK: - Private Functions
private extension HomeViewModel {
    func sendGetSubscriptionsRequest() {
        loading.onNext(true)
        SubscriptionsService.getSubscriptions { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .success(let response):
                self?.subscriptionViewModels = response.data.map { SubscriptionViewModel(subscription: $0) }
            case .failure(let error):
                self?.error.onNext(error)
            }
        }
    }
}
