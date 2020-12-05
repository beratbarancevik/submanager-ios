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
//    case notifications
    case share
    case appStore
    case feedback
    case termsOfService
    case privacyPolicy
    case systemSettings
    
    var icon: Images {
        switch self {
        case .share:
            return .share
        case .appStore:
            return .appStore
        case .feedback:
            return .email
        case .termsOfService:
            return .terms
        case .privacyPolicy:
            return .privacy
        case .systemSettings:
            return .systemSettings
        }
    }
    
    var title: String {
        switch self {
        case .share:
            return "settings_share"
        case .appStore:
            return "settings_appStore"
        case .feedback:
            return "settings_feedback"
        case .termsOfService:
            return "settings_terms"
        case .privacyPolicy:
            return "settings_privacy"
        case .systemSettings:
            return "settings_systemSettings"
        }
    }
}
