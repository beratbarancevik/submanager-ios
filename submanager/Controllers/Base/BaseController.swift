//
//  BaseController.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift
import UIKit

class BaseController: UIViewController {
    let disposeBag = DisposeBag()
    
    #if DEBUG
    var isRunningTests: Bool {
        return NSClassFromString("XCTest") != nil
    }
    #endif
}
