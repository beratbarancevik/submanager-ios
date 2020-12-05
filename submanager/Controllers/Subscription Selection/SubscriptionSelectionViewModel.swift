//
//  SubscriptionSelectionViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift

class SubscriptionSelectionViewModel: BaseControllerViewModel {
    // MARK: - Properties
    let didReceiveSubscriptionTypes = PublishSubject<Bool>()
    let error = PublishSubject<Error>()
    let loading = PublishSubject<Bool>()
    
    var subscriptionTypeViewModels = [SubscriptionTypeViewModel]() {
        didSet {
            didReceiveSubscriptionTypes.onNext(true)
        }
    }
    
    // MARK: - Functions
    func getSubscriptionTypes() {
        sendGetSubscriptionTypesRequest()
    }
}

// MARK: - Private Functions
private extension SubscriptionSelectionViewModel {
    func sendGetSubscriptionTypesRequest() {
        loading.onNext(true)
        SubscriptionsService.getSubscriptionTypes { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .success(let response):
                self?.addAllSubscriptionOptions(response.data)
            case .failure(let error):
                self?.error.onNext(error)
            }
        }
    }
    
    func addAllSubscriptionOptions(_ subscriptionTypes: [SubscriptionType]) {
        var newSubscriptionTypes = subscriptionTypes
        newSubscriptionTypes.insert(SubscriptionType(), at: 0)
        subscriptionTypeViewModels = newSubscriptionTypes.map { SubscriptionTypeViewModel(subscriptionType: $0) }
    }
}
