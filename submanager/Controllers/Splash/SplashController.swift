//
//  SplashController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    private let viewModel = SplashViewModel()
    
    private let logoImageView: UIImageView = {
        $0.image = Images.logo.image
        $0.accessibilityLabel = "splash_logo_image_view".localized
        return $0
    }(UIImageView())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

// MARK: - Private Functions
private extension SplashController {
    func setUpUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { maker in
            maker.center.equalTo(view.safeAreaLayoutGuide)
            maker.width.height.equalTo(128)
        }
    }
}
