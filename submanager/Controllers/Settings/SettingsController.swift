//
//  SettingsController.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SettingsController: BaseController {
    private let viewModel = SettingsViewModel()
    
    // MARK: - UI Properties
    private let dismissBarButtonItem = UIBarButtonItem(image: Images.dismiss.image, style: .plain, target: nil, action: nil)
    
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
extension SettingsController: Setup {
    func setUpUI() {
        view.backgroundColor = .black
        
        navigationController?.navigationBar.accessibilityIdentifier = "settings_navigation_bar".localized
        
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        dismissBarButtonItem.target = self
        navigationItem.leftBarButtonItem = dismissBarButtonItem
    }
    
    func addViews() {
        
    }
    
    func addConstraints() {
        
    }
    
    func addObservers() {
        dismissBarButtonItem.action = #selector(dismissDidTap)
    }
    
    @objc func dismissDidTap() {
        dismiss(animated: true)
    }
}
