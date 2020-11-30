//
//  Error.swift
//  submanager
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

enum GenericError: CaseIterable, Error {
    case `default`
    case emailClient
    case internet
    
    var localizedDescription: String {
        switch self {
        case .default:
            return ""
        case .internet:
            return ""
        case .emailClient:
            return ""
        }
    }
}
