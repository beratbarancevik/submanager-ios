//
//  SubscriptionViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

class SubscriptionViewModel {
    private let subscription: Subscription
    
    init(subscription: Subscription) {
        self.subscription = subscription
    }
    
    var id: String {
        return subscription.id ?? ""
    }
    
    var title: String {
        return subscription.title ?? ""
    }
    
    var description: String {
        return subscription.description ?? ""
    }
    
    var price: Double? {
        guard let price = subscription.price else {
            return nil
        }
        return Double(price)
    }
    
    var imageUrl: URL? {
        guard let imageUrl = subscription.imageUrl, let url = URL(string: imageUrl) else {
            return nil
        }
        return url
    }
}
