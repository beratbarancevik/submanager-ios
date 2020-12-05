//
//  LogManager.swift
//  submanager
//
//  Created by Berat Cevik on 12/5/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Foundation

class LogManager {
    // MARK: - Properties
    private static var isLoggingEnabled: Bool {
        #if RELEASE
        return false
        #else
        return true
        #endif
    }
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Log Functions
    class func req<Req: Request>(_ request: Req) {
        guard isLoggingEnabled else { return }
        
        var body = ""
        var bodyParameters = [String]()
        for value in request.body ?? [:] {
            bodyParameters.append("\(value.key): \(type(of: value))(\(value))")
        }
        body = bodyParameters.joined(separator: ", ")

        var log = "URL: \(ServiceManager.getBaseUrl(from: request.path)?.absoluteString ?? "URL not found")"

        log += "\nHeaders:"
        request.headers.forEach {
            log += "\n\($0)"
        }

        if !bodyParameters.isEmpty {
            log += "\nBody:"
            log += "\n\(body)"
        }
        
        log += "\nMethod: \(request.method.rawValue.uppercased())"

        printLog(icon: "💻", log: log)
    }

    class func res<Res: Response>(path: String, _ response: Res) {
        guard isLoggingEnabled else { return }

        var log = "URL: \(ServiceManager.getBaseUrl(from: path)?.absoluteString ?? "URL not found")"
        
        log += "\nCode: \(response.code)"
        
        log += "\nMessage: \(response.message)"

        log += "\nData: \(response.data)"

        printLog(icon: "✅", log: log)
    }
    
    static func err(_ error: Error) {
        guard isLoggingEnabled else { return }
        
        printLog(icon: "‼️", log: error.localizedDescription)
    }
}

// MARK: - Private Functions
private extension LogManager {
    static func printLog(icon: String, log: String) {
        print("\(icon) [\(Date().description)]\n\(log)\n")
    }
}
