//
//  SubscriptionSelectionController.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionSelectionController: UIViewController {
    private let viewModel = SubscriptionSelectionViewModel()
    
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
extension SubscriptionSelectionController: Setup {
    func setUpUI() {
        view.backgroundColor = .black
        
        navigationController?.navigationBar.accessibilityIdentifier = "subscription_selection_navigation_bar".localized
        
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
