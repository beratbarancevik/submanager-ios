//
//  SubscriptionViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

class SubscriptionViewModel {
    // MARK: - Properties
    private (set) var subscription: Subscription
    
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
    
    var priceDescription: String {
        guard let price = subscription.price else {
            return ""
        }
        return "\(price)"
    }
    
    var priceWithCurrency: String {
        guard let price = subscription.price else {
            return ""
        }
        return "$\(price)"
    }
    
    var startDate: Date? {
        return nil
    }
    
    var startDateDescription: String {
        guard let startDateDescription = subscription.startDate else {
            return ""
        }
        return "\(startDateDescription.simpleDate)"
    }
    
    var imageUrl: URL? {
        guard let imageUrl = subscription.imageUrl, let url = URL(string: imageUrl) else {
            return nil
        }
        return url
    }
    
    // MARK: - Init
    init(subscription: Subscription) {
        self.subscription = subscription
    }
    
    // MARK: - Functions
    func copy() -> SubscriptionViewModel {
        let copy = SubscriptionViewModel(subscription: subscription)
        return copy
    }
    
    func updateTitle(_ title: String) {
        subscription.title = title
    }
    
    func updateDescription(_ description: String) {
        subscription.description = description
    }
    
    func updatePrice(_ price: String) {
        subscription.price = price
    }
    
    func updateStartDate(_ startDate: String) {
        subscription.startDate = startDate.fullDate
    }
}
