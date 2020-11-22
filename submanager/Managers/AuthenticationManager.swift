//
//  AuthenticationManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/22/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Firebase
import RxSwift

class AuthenticationManager: BaseManager {
    static let shared = AuthenticationManager()
    
    private var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    private var idTokenDidChangeListenerHandle: IDTokenDidChangeListenerHandle?
    
    var authDidCompleteSubject = PublishSubject<Bool>()
    
    var authState: AuthState {
        guard let user = Auth.auth().currentUser else {
            return .unknown
        }
        return user.isAnonymous ? .anonymous : .account
    }
    private var token: String?
    var bearerToken: String {
        return "Bearer \(token ?? "")"
    }
    var hasToken: Bool {
        return token != nil
    }
    
    // MARK: - Setup
    private override init() {}
    
    deinit {
        print("AuthenticationManager deinited")
        removeAuthenticationListeners()
    }
    
    // MARK: - Auth Actions
    func setUpAuthentication() {
        registerAuthenticationListeners()
    }
}

// MARK: - Private Functions
private extension AuthenticationManager {
    // MARK: - Auth Handlers
    func registerAuthenticationListeners() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            if let user = user {
                print("\nUser ID: \(user.uid)\nEmail: \(user.email ?? "No email found")\n")
                self?.checkIfAuthCompleted()
            } else {
                print("\nSigning in anonymously\n")
                AuthenticationManager.shared.signInAnonymously()
            }
        }
        
        idTokenDidChangeListenerHandle = Auth.auth().addIDTokenDidChangeListener { [weak self] _, user in
            if let user = user {
                self?.updateLocalToken(user: user)
                self?.checkIfAuthCompleted()
            }
        }
    }
    
    func removeAuthenticationListeners() {
        if let handle = authStateDidChangeListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        
        if let handle = idTokenDidChangeListenerHandle {
            Auth.auth().removeIDTokenDidChangeListener(handle)
        }
    }
    
    func checkIfAuthCompleted() {
        if hasToken && Auth.auth().currentUser != nil {
            authDidCompleteSubject.onNext(true)
        }
    }
    
    // MARK: - Token Generation
    func updateLocalToken(user: User) {
        user.getIDToken { [weak self] token, error in
            if let token = token {
                print("Firebase token:\n\(token)\n")
                self?.token = token
                self?.checkIfAuthCompleted()
            }
            
            if let error = error {
                Crashlytics.crashlytics().record(error: error)
            }
        }
    }
    
    // MARK: - Anonymous Auth
    func signInAnonymously() {
        Auth.auth().signInAnonymously { authResult, error in
            if let result = authResult {
                print("\nSigned in anonymously with user ID: \(result.user.uid)\n")
            }
            
            if let error = error {
                Crashlytics.crashlytics().record(error: error)
            }
        }
    }
}

// MARK: - AuthState
enum AuthState: CaseIterable {
    case unknown
    case anonymous
    case account
}
