//
//  SettingsViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

class SettingsViewModel: BaseControllerViewModel {
    // MARK: - Properties
}

// MARK: - SettingType
enum SettingType: CaseIterable {
    case notifications
    case share
    case appStore
    case systemSettings
    
    var icon: Images {
        switch self {
        case .notifications:
            return .notifications
        case .share:
            return .share
        case .appStore:
            return .appStore
        case .systemSettings:
            return .systemSettings
        }
    }
    
    var title: String {
        switch self {
        case .notifications:
            return "settings_notifications"
        case .share:
            return "settings_share"
        case .appStore:
            return "settings_appStore"
        case .systemSettings:
            return "settings_systemSettings"
        }
    }
}
