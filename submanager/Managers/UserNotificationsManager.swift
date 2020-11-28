//
//  UserNotificationsManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationsManager {
    // MARK: - Properties
    static let shared = UserNotificationsManager()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Functions
    func askForNotificationPermissionIfNecessary() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional, .ephemeral:
                return
            case .notDetermined:
                self?.askForNotificationPermission()
            case .denied:
                self?.openDeviceSettings()
            @unknown default:
                return
            }
        }
    }
}

// MARK: - Private Functions
private extension UserNotificationsManager {
    func askForNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    }
    
    func openDeviceSettings() {
        if UIApplication.shared.canOpenURL(Utility.shared.deviceSettings) {
            UIApplication.shared.open(Utility.shared.deviceSettings)
        }
    }
}
