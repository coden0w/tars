//
//  DependencyInjector.swift
//  tars
//
//  Created by alex on 20/12/24.
//

import Foundation
import Combine

@propertyWrapper
class Dependency<T: Sendable> {
    
    init() {
        // WIP environment configuration
    }
    
    var wrappedValue: T {
        var dependency: T
        switch T.self {
        case is ExampleUseCase.Type:
            dependency = ExampleUseCase() as! T
        default:
            fatalError("Dependency \(T.self) does not exists")
        }
        
        return dependency
    }
}


final class ExampleUseCase: UseCase<Void, String>, @unchecked Sendable {
    override func handle(input: Void?) async throws -> String {
        return "ExampleUseCase Executed"
    }
}

open class UseCase<Input, Output> {
    
    public init() {}
    
    /**
     Main method of executing the useCase.
     This method executes the `handle(input: Input) async throws -> Output` which use async/await.
     
     - Parameters:
     - input: The only parameter where it will have all the necessary properties to execute the useCase.
     
     - Returns: It returns an object of type `Output`.
     */
    public func execute(_ input: Input) async throws -> Output {
        try await handle(input: input)
    }
    
    /**
     This function must be overridden to add code that we want to execute the use case with async/await.
     
     - Parameters:
     - input: The only parameter where it will have all the necessary properties to execute the useCase.
     
     - Returns: It returns an object of type `Output`.
     */
    open func handle(input: Input) async throws -> Output {
        throw NSError(domain: "Not implemented. Override it in subclass.", code: -1000)
    }
    
}

extension UseCase where Input == Void {
    /**
     Main method of executing the useCase.
     This method executes the `handle() async throws -> Output` which use async/await.
     
     - Returns: It returns an object of type `Output`.
     */
    public func execute() async throws -> Output {
        try await handle(input: ())
    }
}

