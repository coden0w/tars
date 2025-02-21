//
//  Environment.swift
//  Domain
//
//  Created by alexandru.robert on 25/1/25.
//

import Foundation

public actor Environment {
    
    enum EnvironmentKey {
        static let `protocol` = "PROTOCOL"
        static let server = "SERVER"
    }
    
    private static let bundleDictionary: [String: Any] = { Bundle.main.infoDictionary ?? [:] }()
    
    static let `protocol`: String = {
        Environment.bundleDictionary[EnvironmentKey.protocol] as? String ?? ""
    }()
    
    static let server: String = {
        Environment.bundleDictionary[EnvironmentKey.server] as? String ?? ""
    }()
}
