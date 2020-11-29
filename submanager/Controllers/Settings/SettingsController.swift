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
    
    private let settingsTableView: UITableView = {
        $0.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        $0.register(SettingFooterView.self, forHeaderFooterViewReuseIdentifier: SettingFooterView.identifier)
        $0.accessibilityLabel = "settings_table_view".localized
        $0.backgroundColor = .secondaryBackground
        return $0
    }(UITableView(frame: .zero, style: Theme.settingsTableViewStyle))
    
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
        navigationController?.navigationBar.accessibilityIdentifier = "settings_navigation_bar".localized
        navigationItem.title = "settings".localized
        navigationController?.navigationBar.backgroundColor = .secondaryBackground
        navigationController?.navigationBar.barTintColor = .secondaryBackground
        
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        dismissBarButtonItem.target = self
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
    
    func addViews() {
        view.addSubview(settingsTableView)
    }
    
    func addConstraints() {
        settingsTableView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeArea)
        }
    }
    
    func addObservers() {
        dismissBarButtonItem.action = #selector(dismissDidTap)
    }
    
    @objc private func dismissDidTap() {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch SettingType.allCases[indexPath.row] {
        case .notifications:
            UserNotificationsManager.shared.askForNotificationPermissionIfNecessary()
        case .share:
            let activityViewController = UIActivityViewController(activityItems: ["app_promotion".localized], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            present(activityViewController, animated: true)
        case .appStore:
            if UIApplication.shared.canOpenURL(Utility.shared.appStoreUrl) {
                UIApplication.shared.open(Utility.shared.appStoreUrl)
            }
        case .systemSettings:
            if UIApplication.shared.canOpenURL(Utility.shared.deviceSettings) {
                UIApplication.shared.open(Utility.shared.deviceSettings)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else { return UITableViewCell() }
        cell.settingType = SettingType.allCases[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingFooterView.identifier) as? SettingFooterView else { return UITableViewHeaderFooterView() }
        return footer
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 64
    }
}
