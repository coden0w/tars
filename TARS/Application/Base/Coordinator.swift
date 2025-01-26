//
//  Coordinator.swift
//  tars
//
//  Created by alexandru.robert on 26/1/25.
//

import Foundation

/**
 A protocol that defines the basic responsibilities of a coordinator.
 The `Coordinator` protocol is used to handle navigation and session management tasks within the application.
 */
public protocol Coordinator {
    /* Empty */
}

/**
 A base implementation of the `Coordinator` protocol.
 
 The `CoordinatorImpl` class conforms to `Coordinator`, `ObservableObject`, and `Identifiable` protocols. It provides
 a basic implementation of session management, allowing it to be used directly or subclassed for custom behavior.
 */

open class CoordinatorImpl: Coordinator, ObservableObject, Identifiable {
    
    /**
     Initializes a new instance of `CoordinatorImpl`.
     This initializer sets up the coordinator, making it ready to manage navigation and session-related tasks.
     */
    public init() {
        /* Empty */
    }
}
