//
//  Encodable+Extensions.swift
//  submanager
//
//  Created by Berat Cevik on 12/1/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
