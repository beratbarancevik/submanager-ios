//
//  BaseNavigationController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    // MARK: - UI Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let rootViewController = viewControllers.last {
            return rootViewController.preferredStatusBarStyle
        }
        return .default
    }
    
    // MARK: - Init
    convenience init(rootViewController: BaseController, prefersLargeTitles: Bool = true) {
        self.init(rootViewController: rootViewController)
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = prefersLargeTitles
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.style(Theme.NavigationBar.primary)
    }
}
