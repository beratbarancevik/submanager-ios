//
//  SubscriptionCell.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionCell: BaseTableCell {
    // MARK: - UI Properties
    private let logoImageView: UIImageView = {
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView().style(Theme.Image.primary))
    private let titleLabel = UILabel().style(Theme.Label.Regular.primary)
    private let priceLabel = UILabel().style(Theme.Label.Regular.tint)
    
    // MARK: - Other Properties
    var subscriptionViewModel: SubscriptionViewModel? {
        didSet {
            guard let viewModel = subscriptionViewModel else { return }
            logoImageView.kf.setImage(
                with: viewModel.imageUrl,
                placeholder: Images.logo.image,
                options: [
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
                ])
            titleLabel.text = viewModel.title
            priceLabel.text = viewModel.priceDescription
        }
    }
    
    var subscriptionTypeViewModel: SubscriptionTypeViewModel? {
        didSet {
            guard let viewModel = subscriptionTypeViewModel else { return }
            logoImageView.kf.setImage(
                with: viewModel.imageUrl,
                placeholder: Images.logo.image,
                options: [
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
                ])
            titleLabel.text = viewModel.title
            priceLabel.isHidden = true
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
extension SubscriptionCell: Setup {
    func setUpUI() {}
    
    func addViews() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
    }
    
    func addConstraints() {
        logoImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(16)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(logoImageView.snp.trailing).offset(16)
            maker.centerY.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(titleLabel.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(32)
            maker.centerY.equalToSuperview()
        }
    }
    
    func addObservers() {}
}
