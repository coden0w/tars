//
//  ApiRepositoryImpl.swift
//  Data
//
//  Created by alexandru.robert on 25/1/25.
//

import Foundation
import Combine
import Domain

public actor ApiRepositoryImpl: ApiRepository {
    
    private static var instance: ApiRepositoryImpl?
    public var `protocol`: String
    public var server: String
    
    public static func shared(`protocol`: String,
                              server: String) -> ApiRepository {
        if let instance = ApiRepositoryImpl.instance {
            return instance
        } else {
            let repository = ApiRepositoryImpl(protocol: `protocol`,
                                               server: server)
            ApiRepositoryImpl.instance = repository
            return repository
        }
    }
    
    // MARK: - Init
    
    internal init(`protocol`: String,
                  server: String) {
        self.protocol = `protocol`
        self.server = server
    }
    
    // MARK: - Methods

    public func foo() async throws -> String {
        return "Foo"
    }

}

// MARK: - Extension

fileprivate extension ApiRepositoryImpl {
    
    enum RequestMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum EncodingType: String {
        static let key = "Content-Type"
        
        case json = "application/json"
        case form = "application/x-www-form-urlencoded"
    }
    
    func request(url: URL,
                 method: RequestMethod,
                 encodig: EncodingType,
                 authorization: String? = nil) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(encodig.rawValue, forHTTPHeaderField: EncodingType.key)
        setAuthorization(request: &request, authorization: authorization)
        
        return request
    }
    
    func setAuthorization(request: inout URLRequest, authorization: String? = nil) {
        if let authorization {
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
        }
    }
    
    func response(request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            let result = try await URLSession.shared.data(for: request)
            try checkResponse(result)
            return result
        } catch {
            throw error
        }
    }
    
    func checkResponse(_ result: (Data, URLResponse)) throws {
        let (data, response) = result
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299:
                return
            case 400...403:
                throw NSError(domain: "Unauthorized Error", code: 0)
            case 500:
                throw NSError(domain: "Internal Server Error", code: 1)
            default:
                throw NSError(domain: "Unknown Error", code: 2)
            }
        }
    }
}
