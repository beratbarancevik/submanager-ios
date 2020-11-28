//
//  SettingCell.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SettingCell: BaseTableCell {
    // MARK: - UI Properties
    private let iconImageView = UIImageView().style(Theme.Image.primary)
    private let titleLabel = UILabel().style(Theme.Label.Regular.primary)
    private let detailIconImageView = UIImageView(image: Images.detail.image).style(Theme.Image.primary)
    
    // MARK: - Other Properties
    var settingType: SettingType? {
        didSet {
            iconImageView.image = settingType?.icon.image
            titleLabel.text = settingType?.title.localized
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
extension SettingCell: Setup {
    func setUpUI() {}
    
    func addViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(detailIconImageView)
    }
    
    func addConstraints() {
        iconImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(16)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(iconImageView.snp.trailing).offset(16)
            maker.centerY.equalToSuperview()
        }
        
        detailIconImageView.snp.makeConstraints { maker in
            maker.leading.equalTo(titleLabel.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(32)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(24)
        }
    }
    
    func addObservers() {}
}
