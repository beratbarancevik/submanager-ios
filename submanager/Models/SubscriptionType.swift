//
//  SubscriptionType.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

struct SubscriptionType: Codable {
    var id: String?
    var title: String?
    var imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? container?.decode(String.self, forKey: CodingKeys.id)
        title = try? container?.decode(String.self, forKey: CodingKeys.title)
        imageUrl = try? container?.decode(String.self, forKey: CodingKeys.imageUrl)
    }
}
