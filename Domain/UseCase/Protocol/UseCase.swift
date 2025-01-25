//
//  UseCase.swift
//  Domain
//
//  Created by alexandru.robert on 25/1/25.
//

import Foundation
import Combine

public protocol UseCase: Sendable {
    /**
     The type of input required to execute the use case.
     This is an associated type, allowing each conforming type to specify its own input type.

     - Note: The input type must conform to `Sendable` to ensure thread-safety and compatibility with Swift's concurrency model.
     */
    associatedtype Input: Sendable
    
    /**
     The type of output produced by the use case.
     This is an associated type, allowing each conforming type to specify its own output type.

     - Note: The output type must conform to `Sendable` to ensure thread-safety and compatibility with Swift's concurrency model.
     */
    associatedtype Output: Sendable
    
    /**
     Main method for handling the business logic of the use case.
     This method must be implemented in any conforming type to execute the core logic.

     - Parameters:
        - input: The input parameter containing all the necessary data to execute the use case.
     
     - Returns: It returns an object of type `Output`.
     */
    func handle(input: Input) async throws -> Output
}

extension UseCase {
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
