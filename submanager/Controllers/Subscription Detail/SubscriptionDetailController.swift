//
//  SubscriptionDetailController.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionDetailController: UIViewController {
    private let viewModel = SubscriptionDetailViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

// MARK: - Private Functions
private extension SubscriptionDetailController {
    func setUpUI() {
        view.backgroundColor = .black
        navigationController?.navigationBar.accessibilityIdentifier = "subscription_detail_navigation_bar".localized
        let dismissBarButtonItem = UIBarButtonItem(image: Images.dismiss.image, style: .plain, target: self, action: #selector(dismissDidTap))
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        navigationItem.leftBarButtonItem = dismissBarButtonItem
    }
    
    @objc func dismissDidTap() {
        dismiss(animated: true)
    }
}
