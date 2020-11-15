//
//  HomeController.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    private let viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

// MARK: - Private Functions
private extension HomeController {
    func setUpUI() {
        navigationController?.navigationBar.accessibilityIdentifier = "home_navigation_bar".localized
        navigationItem.title = "home".localized
        let addBarButtonItem = UIBarButtonItem(image: Images.add.image, style: .plain, target: self, action: #selector(addDidTap))
        addBarButtonItem.accessibilityLabel = "add".localized
        navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    @objc func addDidTap() {
        present(UINavigationController(rootViewController: SubscriptionDetailController()), animated: true)
    }
}
