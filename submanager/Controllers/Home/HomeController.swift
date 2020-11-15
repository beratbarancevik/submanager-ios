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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

// MARK: - Private Functions
private extension HomeController {
    func setUpUI() {
        navigationController?.navigationBar.accessibilityLabel = "home_navigation_bar"
        navigationItem.title = "home".localized
    }
}
