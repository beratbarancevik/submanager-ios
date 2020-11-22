//
//  BaseNavigationController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let rootViewController = viewControllers.last {
            return rootViewController.preferredStatusBarStyle
        }
        return .default
    }
}
