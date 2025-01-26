//
//  Errorable.swift
//  tars
//
//  Created by alexandru.robert on 26/1/25.
//

import Foundation
import SwiftUI

/**
 The `Fallible` protocol defines a structure for managing and presenting errors in an application.

 Types conforming to `Fallible` can store an error conforming to `ErrorRepresentable` and provide methods to handle error clearing and session expiration scenarios.
 */
protocol Fallible: AnyObject {
    /// The current error conforming to `ErrorRepresentable`, or `nil` if no error exists.
//    var error: (any ErrorRepresentable)? { get set }

    /**
     Clears the current error by setting the error property to `nil`.

     This method should be called when the error has been handled or dismissed.
     */
    func clearError()

    /**
     Handles session expiration scenarios, typically invoked when authentication-related errors occur.

     This method is meant to deal with user sessions that are no longer valid and trigger necessary actions, such as reauthentication or logout.
     */
    func sessionExpired()
}
