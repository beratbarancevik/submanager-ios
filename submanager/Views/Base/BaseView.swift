//
//  BaseView.swift
//  submanager
//
//  Created by Berat Cevik on 11/29/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class BaseView: UIView {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        style(Theme.View.primary)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style(Theme.View.primary)
    }
}
