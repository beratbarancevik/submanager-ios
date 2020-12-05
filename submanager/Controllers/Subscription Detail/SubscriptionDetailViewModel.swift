//
//  SubscriptionDetailViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift

class SubscriptionDetailViewModel: BaseControllerViewModel {
    // MARK: - Properties
    var details = SubscriptionDetailType.allCases
    
    var subscriptionViewModel: SubscriptionViewModel?
    var updatedSubscriptionViewModel: SubscriptionViewModel?
    
    var subscriptionTypeViewModel: SubscriptionTypeViewModel?
    
    var isCreateSubscription: Bool {
        return subscriptionTypeViewModel != nil
    }
    
    let didCreateSubscription = PublishSubject<Bool>()
    let didUpdateSubscription = PublishSubject<Bool>()
    let error = PublishSubject<Error>()
    let loading = PublishSubject<Bool>()
    
    // MARK: - Functions
    func saveSubscription() {
        if subscriptionViewModel == nil {
            sendCreateSubscriptionRequest()
        } else {
            sendUpdateSubscriptionRequest()
        }
    }
}

// MARK: - Private Functions
private extension SubscriptionDetailViewModel {
    func sendCreateSubscriptionRequest() {
        guard let subscription = updatedSubscriptionViewModel?.subscription else { return }
        
        loading.onNext(true)
        SubscriptionsService.createSubscription(subscription: subscription) { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .success:
                self?.didCreateSubscription.onNext(true)
            case .failure(let error):
                self?.error.onNext(error)
            }
        }
    }
    
    func sendUpdateSubscriptionRequest() {
        guard let subscription = updatedSubscriptionViewModel?.subscription else { return }
        
        loading.onNext(true)
        SubscriptionsService.updateSubscription(subscription: subscription) { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .success:
                self?.didUpdateSubscription.onNext(true)
            case .failure(let error):
                self?.error.onNext(error)
            }
        }
    }
}

// MARK: - SubscriptionDetailType
enum SubscriptionDetailType: CaseIterable {
    case title
    case description
    case price
    case startDate
    
    var name: String {
        switch self {
        case .title:
            return "subscription_detail_title_name"
        case .description:
            return "subscription_detail_description_name"
        case .price:
            return "subscription_detail_price_name"
        case .startDate:
            return "subscription_detail_start_date_name"
        }
    }
    
    var placeholder: String {
        switch self {
        case .title:
            return "subscription_detail_title_placeholder"
        case .description:
            return "subscription_detail_description_placeholder"
        case .price:
            return "subscription_detail_price_placeholder"
        case .startDate:
            return "subscription_detail_start_date_placeholder"
        }
    }
}
