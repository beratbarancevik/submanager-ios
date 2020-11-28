//
//  SettingFooterView.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SettingFooterView: BaseTableHeaderFooterView {
    // MARK: - UI Properties
    private let versionLabel: UILabel = {
        $0.textAlignment = .center
        return $0
    }(UILabel().style(Theme.Label.Regular.primary))
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
    }
}

// MARK: - Setup
extension SettingFooterView: Setup {
    func setUpUI() {
        contentView.backgroundColor = .secondaryBackground
        versionLabel.text = String(format: "settings_version".localized, Utility.shared.appVersion)
    }
    
    func addViews() {
        addSubview(versionLabel)
    }
    
    func addConstraints() {
        versionLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(32)
            maker.centerY.equalToSuperview()
        }
    }
    
    func addObservers() {}
}
