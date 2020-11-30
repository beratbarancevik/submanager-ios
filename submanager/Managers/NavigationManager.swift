//
//  NavigationManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import SafariServices
import UIKit

class NavigationManager: BaseManager {
    // MARK: - External Navigation
    func openURL(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - SFSafariViewController
    func openURL(_ url: URL, from viewController: BaseController?) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .tintColor
        safariViewController.preferredBarTintColor = .primaryBackground
        if #available(iOS 11.0, *) {
            safariViewController.dismissButtonStyle = .close
        }
        viewController?.present(safariViewController, animated: true)
    }
    
    func openURL(_ urlString: String, from viewController: BaseController?) {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .tintColor
        safariViewController.preferredBarTintColor = .primaryBackground
        if #available(iOS 11.0, *) {
            safariViewController.dismissButtonStyle = .close
        }
        viewController?.present(safariViewController, animated: true)
    }
}
