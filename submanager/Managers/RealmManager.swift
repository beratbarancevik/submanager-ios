//
//  RealmManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/17/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private var realm: Realm?
    
    // MARK: - Setup
    private init() {}
    
    func startRealm() throws {
        do {
            realm = try Realm()
        } catch {
            throw error
            // TODO: add exponential backoff
        }
    }
}
