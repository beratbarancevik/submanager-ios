//
//  SubscriptionDetailHeaderView.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

protocol SubscriptionDetailHeaderViewDelegate: AnyObject {
    func imageViewDidTap()
}

class SubscriptionDetailHeaderView: BaseTableHeaderFooterView {
    // MARK: - UI Properties
    private let logoImageView: UIImageView = {
        $0.isUserInteractionEnabled = true
        $0.layer.cornerRadius = 64
        return $0
    }(UIImageView().style(Theme.Image.primary))
    
    // MARK: - Other Properties
    weak var delegate: SubscriptionDetailHeaderViewDelegate?
    
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
    
    var image: UIImage? {
        didSet {
            logoImageView.image = image
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
    func setUpUI() {}
    
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
    
    func addObservers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(logoImageViewDidTap))
        logoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func logoImageViewDidTap() {
        delegate?.imageViewDidTap()
    }
}
