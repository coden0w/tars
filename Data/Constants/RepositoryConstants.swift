//
//  RepositoryConstants.swift
//  Data
//
//  Created by alexandru.robert on 26/1/25.
//

import Foundation

struct RepositoryConstants {
    
    // MARK: - Paths
    
    enum PathUrl: String {
        case api = "api"
        case none = ""
    }
    
    // MARK: - Endpoints
    
    enum EndpointUrl: String {
        case character = "character"
        case location = "location"
        case episode = "episode"
        case none = ""
    }
    
    // MARK: - BuildURL
    
    /**
     Constructs a complete URL by combining the base URL, paths, and optional query parameters.
     
     - Parameters:
        - baseURL: The base URL as a `String` (e.g., "https://rickandmortyapi.com").
        - paths: An array of `String` representing the path components to append to the base URL.
        - queryParams: A dictionary of query parameters where the key is the parameter name and the value is its value. Defaults to an empty dictionary.
     
     - Throws: Throws an error if the URL cannot be constructed (e.g., invalid base URL or query parameters).
     
     - Returns: A valid `URL` object constructed from the provided components.
     */
    static func buildURL(baseURL: String,
                         paths: [PathUrl],
                         endpoint: EndpointUrl,
                         queryParams: [String: String] = [:]) throws -> URL {
        
        var urlString = baseURL // https://rickandmortyapi.com
        
        let fullPath = paths.filter({ $0 != .none }).map({ $0.rawValue }).joined(separator: "/")
        if !fullPath.isEmpty {
            urlString = String(format: "%@/%@", urlString, fullPath)
        }
        
        if endpoint != .none {
            urlString = String(format: "%@%@", urlString, endpoint.rawValue)
        }
        
        guard var urlComponents = URLComponents(string: urlString) else {
            throw NSError(domain: "Bad Url Error", code: 3, userInfo: nil)
        }
        
        if !queryParams.isEmpty {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else {
            throw NSError(domain: "Bad Url Error", code: 3, userInfo: nil)
        }
        
        return url
    }
}
