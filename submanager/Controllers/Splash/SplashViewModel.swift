//
//  SplashViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift

class SplashViewModel: BaseControllerViewModel {
    // MARK: - Properties
    let authDidCompleteSubject = PublishSubject<Bool>()
    
    // MARK: - Init
    override init() {
        super.init()
        addObservers()
    }
    
    // MARK: - Setup
    func addObservers() {
        AuthenticationManager.shared.authDidCompleteSubject.subscribe { [weak self] event in
            if event.element ?? false {
                self?.authDidCompleteSubject.onNext(true)
            }
        }.disposed(by: disposeBag)
    }
    
    // MARK: - Auth
    func setUpAuthentication() {
        AuthenticationManager.shared.setUpAuthentication()
    }
}
