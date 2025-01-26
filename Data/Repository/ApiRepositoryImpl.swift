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
    public var baseURL: String
    
    /**
     Static method to get the shared instance of the repository. If it doesn't exist, a new one is created.
     
     - Parameters:
     - protocol: The protocol to use for requests (HTTP/HTTPS).
     - server: The server address to connect to.
     
     - Returns: An instance of `ApiRepository`.
     */
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
    
    /**
     Private initializer for the repository.
     
     - Parameters:
     - protocol: The protocol to use for requests (HTTP/HTTPS).
     - server: The server address to connect to.
     */
    internal init(`protocol`: String,
                  server: String) {
        self.baseURL = String(format: "%@://%@", `protocol`, server)
    }
    
    // MARK: - Methods

    /**
     Example asynchronous method to simulate an API request.
     
     - Returns: A string with the value "Foo".
     - Throws: May throw errors depending on the implementation.
     */
    public func foo() async throws -> String {
        do {
            let url = try RepositoryConstants.buildURL(baseURL: baseURL,
                                                       paths: [.api],
                                                       endpoint: .character,
                                                       queryParams: ["page":"19"])
        } catch {
            throw error
        }
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
    /**
     Creates a `URLRequest` for the API.
     
     - Parameters:
     - url: The URL to which the request will be sent.
     - method: The HTTP method (GET, POST).
     - encoding: The content encoding type.
     - authorization: An optional authorization token to include in the headers.
     
     - Returns: A configured `URLRequest` object with the specified values.
     */
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
    
    /**
     Sets the authorization header for the request if needed.
     
     - Parameters:
     - request: The request to modify.
     - authorization: The authorization token to add to the header (optional).
     */
    func setAuthorization(request: inout URLRequest, authorization: String? = nil) {
        if let authorization {
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
        }
    }
    
    /**
     Makes an asynchronous request and handles the response.
     
     - Parameters:
     - request: The request to be sent.
     
     - Returns: The response data and HTTP response.
     - Throws: Throws an error if the request fails or if the response has an error status code.
     */
    func response(request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            let result = try await URLSession.shared.data(for: request)
            try checkResponse(result)
            return result
        } catch {
            throw error
        }
    }
    
    /**
     Checks the HTTP status code of the response and throws an error if it's not successful.
     
     - Parameters:
     - result: The tuple containing the response data and the HTTP response.
     - Throws: Throws an error if the HTTP status code indicates a failure (e.g., 400 or 500).
     */
    func checkResponse(_ result: (Data, URLResponse)) throws {
        let (_, response) = result
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
