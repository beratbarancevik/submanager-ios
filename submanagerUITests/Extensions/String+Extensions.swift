//
//  String+Extensions.swift
//  submanagerUITests
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation
@testable import submanager

extension String {
    var localized: String {
        return NSLocalizedString(self, bundle: Bundle(for: HomeControllerUITests.self), comment: "")
    }
}
