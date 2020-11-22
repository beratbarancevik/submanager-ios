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
    var sut1: HttpMethod.Type!
    var sut2: HttpHeader.Type!
    var sut3: ServiceError.Type!
    
    override func setUp() {
        super.setUp()
        sut1 = HttpMethod.self
        sut2 = HttpHeader.self
        sut3 = ServiceError.self
    }
    
    func testHttpMethods() {
        XCTAssertEqual(sut1.allCases.count, 4)
        XCTAssertEqual(sut1.get.alamofireHttpMethod, HTTPMethod.get)
        XCTAssertEqual(sut1.post.alamofireHttpMethod, HTTPMethod.post)
        XCTAssertEqual(sut1.put.alamofireHttpMethod, HTTPMethod.put)
        XCTAssertEqual(sut1.delete.alamofireHttpMethod, HTTPMethod.delete)
    }
    
    func testHeaders() {
        XCTAssertEqual(sut2.allCases.count, 2)
        XCTAssertEqual(sut2.authorization.rawValue, "Authorization")
        XCTAssertEqual(sut2.contentType.rawValue, "Content-Type")
        XCTAssertEqual(sut2.allHeaders[sut2.authorization.rawValue], "Bearer ")
        XCTAssertEqual(sut2.allHeaders[sut2.contentType.rawValue], "application/json")
    }
    
    func testServiceErrors() {
        XCTAssertEqual(sut3.allCases.count, 4)
    }
}
