//
//  SubscriptionDetailViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class SubscriptionDetailViewModel: BaseControllerViewModel {
    // MARK: - Properties
    var details = SubscriptionDetailType.allCases
    
    var subscriptionViewModel: SubscriptionViewModel?
    
    // MARK: - Functions
    func saveSubscription() {
        sendCreateSubscriptionRequest()
        sendUpdateSubscriptionRequest()
    }
}

// MARK: - Private Functions
private extension SubscriptionDetailViewModel {
    func sendCreateSubscriptionRequest() {
        
    }
    
    func sendUpdateSubscriptionRequest() {
        
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
