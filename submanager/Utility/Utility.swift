//
//  Utility.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_unwrapping

import MessageUI
import UIKit

class Utility {
    // MARK: - Properties
    static let shared = Utility()
    
    var appVersion: String {
        guard let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "-" }
        return currentVersion
    }
    
    var deviceSettings: URL {
        return URL(string: UIApplication.openSettingsURLString)!
    }
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Email
    func getMailComposeViewController() -> MFMailComposeViewController? {
        let subject = "Sub Manager Feedback"
        let messageBody = """
        Hello,
        
        
        
        Best
        """
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setToRecipients([Constants.feedbackEmail.rawValue])
            mailComposeViewController.setSubject(subject)
            mailComposeViewController.setMessageBody(messageBody, isHTML: false)
            mailComposeViewController.navigationBar.tintColor = .tintColor
            return mailComposeViewController
        }
        return nil
    }
}
