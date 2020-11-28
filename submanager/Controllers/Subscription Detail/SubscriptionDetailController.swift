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
    
    // MARK: - UI Properties
    let dismissBarButtonItem = UIBarButtonItem(image: Images.dismiss.image, style: .plain, target: nil, action: nil)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
    }
}

// MARK: - Setup
extension SubscriptionDetailController: Setup {
    func setUpUI() {
        view.backgroundColor = .black
        
        navigationController?.navigationBar.accessibilityIdentifier = "subscription_detail_navigation_bar".localized
        
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        dismissBarButtonItem.target = self
        dismissBarButtonItem.action = #selector(dismissDidTap)
        navigationItem.leftBarButtonItem = dismissBarButtonItem
    }
    
    func addViews() {
        
    }
    
    func addConstraints() {
        
    }
    
    func addObservers() {
        
    }
    
    @objc func dismissDidTap() {
        dismiss(animated: true)
    }
}
