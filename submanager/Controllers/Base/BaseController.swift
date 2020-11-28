//
//  BaseController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift
import UIKit

protocol Setup {
    func setUpUI()
    func addViews()
    func addConstraints()
    func addObservers()
}

class BaseController: UIViewController {
    let disposeBag = DisposeBag()
    
    #if DEBUG
    var isRunningTests: Bool {
        return NSClassFromString("XCTest") != nil
    }
    #endif
    
    // MARK: - Root View Anchors
    /// Created to handle safeAreaLayoutGuide for iOS 11.0 and above
    var safeArea: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide
        }
        return view.layoutMarginsGuide
    }
}
