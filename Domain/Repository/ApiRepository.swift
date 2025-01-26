//
//  ApiRepository.swift
//  Domain
//
//  Created by alexandru.robert on 25/1/25.
//

import Foundation
import Combine

/**
   This is a global actor that defines a concurrency context for background tasks.
   The `BGActor` ensures that tasks executed under it are handled in a background thread.
*/
@globalActor
public actor BGActor {
    
    /**
       Shared instance of the global actor `BGActor`.
       This instance is used to access the global concurrency context in the background thread.
    */
    public static let shared = BGActor()
}

/**
   The `ApiRepository` protocol defines a set of methods that should execute within the context of `BGActor`.
   Methods marked with `@BGActor` will run in a background thread managed by this global actor.
*/
public protocol ApiRepository {
    /**
       The `foo()` method is marked with `@BGActor`, which guarantees that it will execute within the `BGActor` context.
       This means that operations within `foo()` will run on a background thread and will not block the main thread.
       
       - Returns: A `String` containing the value "Foo".
       - Throws: An error if the operation fails.
    */
    @BGActor func foo() async throws -> String
}
