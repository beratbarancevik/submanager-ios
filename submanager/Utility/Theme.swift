//
//  Theme.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_unwrapping

import UIKit

// MARK: - Style
struct Style<View: UIView> {
    let style: (View) -> Void
    
    init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    func apply(to view: View) {
        style(view)
    }
}

extension UIView {
    @discardableResult
    func style<V>(_ style: Style<V>) -> V {
        let view = self as! V
        style.apply(to: view)
        return view
    }
}

enum Theme {
    enum NavigationBar {
        static let navigationBar = Style<UINavigationBar> {
            let titleTextAttributes = [NSAttributedString.Key.font: Montserrat.light.font(size: 20)]
            $0.titleTextAttributes = titleTextAttributes as [NSAttributedString.Key: Any]
            $0.tintColor = .primaryText
            $0.barTintColor = .primaryBackground
            if #available(iOS 11.0, *) {
                $0.prefersLargeTitles = true
                let largeTitleTextAttributes = [NSAttributedString.Key.font: Montserrat.light.font(size: 27)]
                $0.largeTitleTextAttributes = largeTitleTextAttributes as [NSAttributedString.Key: Any]
            }
        }
    }
}

// MARK: - Custom Font
enum Montserrat: String {
    case thin = "Montserrat-Thin"
    case extraLight = "Montserrat-ExtraLight"
    case light = "Montserrat-Light"
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"
    case semiBold = "Montserrat-SemiBold"
    case bold = "Montserrat-Bold"
    case black = "Montserrat-Black"
    case extraBlack = "Montserrat-ExtraBlack"
    
    func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
