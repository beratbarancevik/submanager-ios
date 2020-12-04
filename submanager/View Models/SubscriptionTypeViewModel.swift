//
//  SubscriptionTypeViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

class SubscriptionTypeViewModel {
    // MARK: - Properties
    private let subscriptionType: SubscriptionType
    
    var id: String {
        return subscriptionType.id ?? ""
    }
    
    var title: String {
        return subscriptionType.title ?? ""
    }
    
    var imageUrl: URL? {
        guard let imageUrl = subscriptionType.imageUrl, let url = URL(string: imageUrl) else {
            return nil
        }
        return url
    }
    
    // MARK: - Init
    init(subscriptionType: SubscriptionType) {
        self.subscriptionType = subscriptionType
    }
}
