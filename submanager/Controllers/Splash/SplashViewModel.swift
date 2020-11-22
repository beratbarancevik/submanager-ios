//
//  SplashViewModel.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift

class SplashViewModel: BaseViewModel {
    var authDidCompleteSubject = PublishSubject<Bool>()
    
    // MARK: - Setup
    override init() {
        super.init()
        addObservers()
    }
    
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
