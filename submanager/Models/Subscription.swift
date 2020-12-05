//
//  Subscription.swift
//  submanager
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

struct Subscription: Codable {
    var id: String?
    var typeId: String?
    var title: String?
    var description: String?
    var price: String?
    var startDate: String?
    var imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case typeId
        case title
        case description
        case price
        case startDate = "startedAt"
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? container?.decode(String.self, forKey: CodingKeys.id)
        title = try? container?.decode(String.self, forKey: CodingKeys.title)
        description = try? container?.decode(String.self, forKey: CodingKeys.description)
        price = try? container?.decode(String.self, forKey: CodingKeys.price)
        startDate = try? container?.decode(String.self, forKey: CodingKeys.startDate)
        imageUrl = try? container?.decode(String.self, forKey: CodingKeys.imageUrl)
    }
    
    init(subscriptionType: SubscriptionType) {
        self.typeId = subscriptionType.id
        self.title = subscriptionType.title
        self.imageUrl = subscriptionType.imageUrl
    }
}
