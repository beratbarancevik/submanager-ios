//
//  Theme.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

// swiftlint:disable force_unwrapping
// swiftlint:disable nesting

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

// MARK: - Theme
enum Theme {
    enum Button {
        static let primary = Style<UIButton> {
            $0.setTitleColor(.white, for: .normal)
            $0.tintColor = .white
            $0.titleLabel?.font = Montserrat.regular.font(size: 17)
        }
    }
    
    enum Image {
        static let primary = Style<UIImageView> {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
    }
    
    enum Label {
        enum Regular {
            static let primary = Style<UILabel> {
                $0.textColor = .primaryText
                $0.font = Montserrat.regular.font(size: 17)
                $0.numberOfLines = 1
            }
            
            static let tint = Style<UILabel> {
                $0.textColor = .tintColor
                $0.font = Montserrat.regular.font(size: 17)
                $0.numberOfLines = 1
            }
        }
    }
    
    enum NavigationBar {
        static let primary = Style<UINavigationBar> {
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
    
    enum RefreshControl {
        static let primary = Style<UIRefreshControl> {
            $0.tintColor = .primaryBackgroundReversed
        }
    }
    
    enum Table {
        static let primary = Style<UITableView> {
            $0.backgroundColor = .primaryBackground
            $0.keyboardDismissMode = .onDrag
            $0.tableFooterView = UIView()
            $0.alwaysBounceVertical = true
        }
    }
    
    enum View {
        static let primary = Style<UIView> {
            $0.backgroundColor = .primaryBackground
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
