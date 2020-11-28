//
//  AppDelegate.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import Firebase
import Kingfisher
import SnapKit
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpFirebase()
        setUpUI()
        displayHome()
        return true
    }
}

// MARK: - Setup
private extension AppDelegate {
    func setUpFirebase() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    func setUpUI() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
        Theme.configureTheme()
    }
    
    func displayHome() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashController()
        window?.makeKeyAndVisible()
    }
}
