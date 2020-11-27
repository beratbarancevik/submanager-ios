//
//  BaseService.swift
//  submanager
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Alamofire

protocol Request {
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String] { get }
    var query: [String: Any] { get }
    var body: [String: Any]? { get }
}

protocol Response: Codable {
    associatedtype T
    var code: String { get }
    var message: String { get }
    var data: T { get }
}

enum HttpMethod: CaseIterable {
    case get
    case post
    case put
    case delete
    
    var alamofireHttpMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}

enum HttpHeader: String, CaseIterable {
    case authorization = "Authorization"
    case contentType = "Content-Type"
    
    static var allHeaders: [String: String] {
        return [
            self.authorization.rawValue: "Bearer ",
            self.contentType.rawValue: "application/json"
        ]
    }
    
    static var headersExceptToken: [String: String] {
        return [
            self.contentType.rawValue: "application/json"
        ]
    }
}

enum ServiceError: String, Error, CaseIterable {
    case invalidUrl
    case jsonDecodingFailed
    case notFound
    case unauthorized
}
