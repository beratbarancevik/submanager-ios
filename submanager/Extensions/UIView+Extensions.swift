//
//  UIView+Extensions.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func style<V>(_ style: Style<V>) -> V {
        let view = self as! V
        style.apply(to: view)
        return view
    }
}
