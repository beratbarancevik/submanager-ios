//
//  ServiceManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/21/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import Alamofire
import Foundation

class ServiceManager {
    // MARK: - Init
    private init() {}
    
    // MARK: - Service Request
    static func sendRequest<Req: Request, Res: Response>(_ request: Req, _ responseType: Res.Type, completion: @escaping (Result<Res, Error>) -> Void) {
        LogManager.req(request)
        
        guard let url = getBaseUrl(from: request.path) else {
            completion(Result.failure(ServiceError.invalidUrl))
            return
        }
        
        let method = request.method.alamofireHttpMethod
        let body = request.body
        let encoding = JSONEncoding.default
        let headers = getHeaders(from: request.headers)
        
        AF.request(url, method: method, parameters: body, encoding: encoding, headers: headers).validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let responseModel = try JSONDecoder().decode(responseType, from: data)
                    LogManager.res(path: url.absoluteString, responseModel)
                    completion(Result.success(responseModel))
                } catch {
                    LogManager.err(ServiceError.jsonDecodingFailed)
                    completion(Result.failure(ServiceError.jsonDecodingFailed))
                }
            case .failure(let error):
                LogManager.err(error)
                switch response.response?.statusCode {
                case 401:
                    completion(Result.failure(ServiceError.unauthorized))
                    return
                case 404:
                    completion(Result.failure(ServiceError.notFound))
                    return
                default:
                    completion(Result.failure(error))
                }
            }
        }
    }
}

// MARK: - Private Functions
extension ServiceManager {
    static func getBaseUrl(from path: String) -> URL? {
        return URL(string: "\(SecretConstants.baseUrl.value)\(path)")
    }
    
    static func getHeaders(from dict: [String: String]) -> HTTPHeaders {
        let headers = dict.map { HTTPHeader(name: $0.key, value: $0.value) }
        return HTTPHeaders(headers)
    }
}
