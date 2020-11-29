//
//  Utility.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import UIKit

class Utility {
    // MARK: - Properties
    static let shared = Utility()
    
    var appVersion: String {
        guard let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "-" }
        return currentVersion
    }
    
    var appStoreUrl: URL {
        return URL(string: Constants.appStoreUrl.rawValue)!
    }
    
    var deviceSettings: URL {
        return URL(string: UIApplication.openSettingsURLString)!
    }
    
    // MARK: - Init
    private init() {}
}
