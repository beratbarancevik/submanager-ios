//
//  UIColor+Extensions.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

extension UIColor {
    // MARK: - Text Colors
    static var primaryText: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        }
        return .darkText
    }
    
    static var secondaryText: UIColor {
        if #available(iOS 13.0, *) {
            return .secondaryLabel
        }
        return .darkGray
    }
    
    // MARK: - Background Colors
    static var primaryBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        }
        return .white
    }
    
    static var secondaryBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .secondarySystemBackground
        }
        return .white
    }
    
    static var tertiaryBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .tertiarySystemBackground
        }
        return .white
    }
    
    // MARK: - Init
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double = 1.0) {
        let redValue = CGFloat(red) / 255
        let greenValue = CGFloat(green) / 255
        let blueVlue = CGFloat(blue) / 255
        let alphaValue = CGFloat(alpha)
        self.init(red: redValue, green: greenValue, blue: blueVlue, alpha: alphaValue)
    }
}
