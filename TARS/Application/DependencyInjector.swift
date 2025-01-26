//
//  DependencyInjector.swift
//  tars
//
//  Created by alex on 20/12/24.
//

import Foundation
import Combine
import Domain
import Data

@propertyWrapper
class Dependency<T: Sendable> {
    
    init() {
        // WIP environment configuration
    }
    
    var wrappedValue: T {
        var dependency: T
        switch T.self {
        case is FooUseCase.Type:
            dependency = FooUseCase() as! T
        default:
            fatalError("Dependency \(T.self) does not exists")
        }
        
        return dependency
    }
}

extension Dependency {
    
    private func getApiRepository() -> ApiRepository {
        return ApiRepositoryImpl.shared(protocol: Environment.protocol,
                                        server: Environment.server) as! ApiRepository
    }
}
