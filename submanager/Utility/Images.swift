//
//  Image.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_unwrapping

import UIKit

enum Images: String, CaseIterable {
    case add
    case appStore
    case detail
    case dismiss
    case logo
    case moreHorizontal
    case notifications
    case settings
    case share
    case systemSettings
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
