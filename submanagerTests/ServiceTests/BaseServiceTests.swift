//
//  BaseServiceTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Alamofire
import XCTest
@testable import SM_Debug

class BaseServiceTests: XCTestCase {
    func testHttpMethods() {
        XCTAssertEqual(HttpMethod.allCases.count, 4)
        XCTAssertEqual(HttpMethod.get.alamofireHttpMethod, HTTPMethod.get)
        XCTAssertEqual(HttpMethod.post.alamofireHttpMethod, HTTPMethod.post)
        XCTAssertEqual(HttpMethod.put.alamofireHttpMethod, HTTPMethod.put)
        XCTAssertEqual(HttpMethod.delete.alamofireHttpMethod, HTTPMethod.delete)
    }
    
    func testHeaders() {
        XCTAssertEqual(HttpHeader.allCases.count, 2)
        XCTAssertEqual(HttpHeader.authorization.rawValue, "Authorization")
        XCTAssertEqual(HttpHeader.contentType.rawValue, "Content-Type")
        XCTAssertEqual(HttpHeader.allHeaders[HttpHeader.authorization.rawValue], "Bearer ")
        XCTAssertEqual(HttpHeader.allHeaders[HttpHeader.contentType.rawValue], "application/json")
    }
    
    func testServiceErrors() {
        XCTAssertEqual(ServiceError.allCases.count, 4)
    }
}
