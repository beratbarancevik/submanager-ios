//
//  ServiceManagerTests.swift
//  submanagerTests
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Alamofire
import XCTest
@testable import SM_Debug

class ServiceManagerTests: XCTestCase {
    var sut: ServiceManager.Type!
    
    override func setUp() {
        super.setUp()
        sut = ServiceManager.self
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInvalidUrlError() {
        let expectation = XCTestExpectation(description: "Should result in invalid url error")
        let request = FlawedUrlTestRequest()
        sut.sendRequest(request, SuccessfulTestReponse.self) { result in
            switch result {
            case .success:
                XCTFail("The request shouldn't have succeeded")
            case .failure(let error):
                guard let serviceError = error as? ServiceError else {
                    XCTFail(error.localizedDescription)
                    return
                }
                XCTAssertEqual(serviceError, ServiceError.invalidUrl)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testUnauthorizedError() {
        let expectation = XCTestExpectation(description: "Should result in unauthorized error")
        let request = UnauthorizedTestRequest()
        sut.sendRequest(request, SuccessfulTestReponse.self) { result in
            switch result {
            case .success:
                XCTFail("The request shouldn't have succeeded")
            case .failure(let error):
                guard let serviceError = error as? ServiceError else {
                    XCTFail(error.localizedDescription)
                    return
                }
                XCTAssertEqual(serviceError, ServiceError.unauthorized)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testNotFoundError() {
        let expectation = XCTestExpectation(description: "Should result in not found error")
        let request = NonExistentUrlTestRequest()
        sut.sendRequest(request, SuccessfulTestReponse.self) { result in
            switch result {
            case .success:
                XCTFail("The request shouldn't have succeeded")
            case .failure(let error):
                guard let serviceError = error as? ServiceError else {
                    XCTFail(error.localizedDescription)
                    return
                }
                XCTAssertEqual(serviceError, ServiceError.notFound)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testJsonDecoderFailedError() {
        let expectation = XCTestExpectation(description: "Should result in json decoding failed error")
        let request = SuccessfulTestRequest()
        sut.sendRequest(request, WrongDataTestReponse.self) { result in
            switch result {
            case .success:
                XCTFail("The request shouldn't have succeeded")
            case .failure(let error):
                guard let serviceError = error as? ServiceError else {
                    XCTFail(error.localizedDescription)
                    return
                }
                XCTAssertEqual(serviceError, ServiceError.jsonDecodingFailed)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSuccessfulResult() {
        let expectation = XCTestExpectation(description: "Should result in success")
        let request = SuccessfulTestRequest()
        sut.sendRequest(request, SuccessfulTestReponse.self) { result in
            switch result {
            case .success:
                XCTAssert(true)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}

class FlawedUrlTestRequest: SM_Debug.Request {
    var path = ">"
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.allHeaders
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
}

class UnauthorizedTestRequest: SM_Debug.Request {
    var path = "/subscriptions"
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.headersExceptToken
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
}

class NonExistentUrlTestRequest: SM_Debug.Request {
    var path = "/test"
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.headersExceptToken
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
    
    init() {
        headers[HttpHeader.authorization.rawValue] = "Bearer \(TestConstants.token)"
    }
}

class SuccessfulTestRequest: SM_Debug.Request {
    var path = "/subscriptions"
    
    var method: HttpMethod = .get
    
    var headers: [String: String] = HttpHeader.headersExceptToken
    
    var query: [String: Any] = [:]
    
    var body: [String: Any]?
    
    init() {
        headers[HttpHeader.authorization.rawValue] = "Bearer \(TestConstants.token)"
    }
}

struct WrongDataTestReponse: Response {
    typealias T = [String: String]
    
    var code: String
    
    var message: String
    
    var data: [String: String]
}

struct SuccessfulTestReponse: Response {
    typealias T = [Subscription]
    
    var code: String
    
    var message: String
    
    var data: [Subscription]
}
