//
//  SplashController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift
import UIKit

class SplashController: BaseController {
    private let viewModel = SplashViewModel()
    
    private let logoImageView: UIImageView = {
        $0.image = Images.logo.image
        $0.accessibilityLabel = "splash_logo_image_view".localized
        return $0
    }(UIImageView())
    
    private var disposable: Disposable?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setUpAuthentication()
    }
}

// MARK: - Private Functions
private extension SplashController {
    // MARK: - Setup
    func setUpUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { maker in
            maker.center.equalTo(view.safeAreaLayoutGuide)
            maker.width.height.equalTo(128)
        }
    }
    
    func addObservers() {
        disposable = viewModel.authDidCompleteSubject.subscribe { [weak self] event in
            if event.element ?? false {
                self?.displayHome()
            }
        }
    }
    
    // MARK: - Navigation
    func displayHome() {
        #if DEBUG
        // ensures that splash screen's UI gets tested
        if ProcessInfo.processInfo.environment["ShouldStopAtSplash"] == "YES" {
            print("isRunningTests")
            return
        }
        #endif
        disposable?.dispose()
        UIApplication.shared.keyWindow?.rootViewController = BaseNavigationController(rootViewController: HomeController())
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
