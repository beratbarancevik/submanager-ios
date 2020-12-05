//
//  Date+Extensions.swift
//  submanagerTests
//
//  Created by Berat Cevik on 12/2/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

extension Date {
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }
    
    var description: String {
        return dateFormatter.string(from: self)
    }
}
