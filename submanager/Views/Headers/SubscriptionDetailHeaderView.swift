//
//  SubscriptionDetailHeaderView.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionDetailHeaderView: BaseTableHeaderFooterView {
    private let logoImageView: UIImageView = {
        $0.style(Theme.Image.primary)
        $0.layer.cornerRadius = 64
        return $0
    }(UIImageView())
    
    var imageUrl: URL? {
        didSet {
            logoImageView.kf.setImage(
                with: imageUrl,
                placeholder: Images.logo.image,
                options: [
                    .transition(.fade(0.5)),
                    .cacheOriginalImage
                ])
        }
    }
    
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
extension SubscriptionDetailHeaderView: Setup {
    func setUpUI() {
        
    }
    
    func addViews() {
        addSubview(logoImageView)
    }
    
    func addConstraints() {
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(32)
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(128)
        }
    }
    
    func addObservers() {}
}
