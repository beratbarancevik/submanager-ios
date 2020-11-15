//
//  String+Extensions.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
