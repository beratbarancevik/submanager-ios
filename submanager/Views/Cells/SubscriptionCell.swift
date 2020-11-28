//
//  SubscriptionCell.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionCell: BaseTableCell {
    private let titleLabel: UILabel = {
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var subscriptionViewModel: SubscriptionViewModel? {
        didSet {
            guard let viewModel = subscriptionViewModel else { return }
            titleLabel.text = viewModel.title
        }
    }
    
    // MARK: - Setup
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
}

// MARK: - Private Functions
private extension SubscriptionCell {
    func setUpUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(16)
        }
    }
}
