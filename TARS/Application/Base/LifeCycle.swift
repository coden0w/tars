//
//  LifeCycle.swift
//  tars
//
//  Created by alexandru.robert on 26/1/25.
//

import Foundation
import SwiftUI
import Combine

/**
 A protocol that defines the lifecycle events for a view.
 
 Types conforming to this protocol must implement methods to handle
 appearance and disappearance events of a view.
 */
protocol LifeCycle {
    /// Called when the view call to onAppear.
    func onAppear() async
    
    /// Called when the view call to onDisappear.
    func onDisappear() async
}

extension View {
    /**
     Binds the lifecycle of the view to an instance conforming to `ViewLifeCycle`.

     This function applies the `LifeCycleModifier` to the view, allowing the
     instance conforming to `ViewLifeCycle` to handle the `onAppear` and `onDisappear` events.

     - Parameter lifeCycle: An instance conforming to `ViewLifeCycle` to bind the view lifecycle.
     - Returns: A modified view that triggers the `onAppear` and `onDisappear` methods from the provided `lifeCycle` instance.
     */
    func bind(lifeCycle: LifeCycle) -> some View {
        self
            .onAppear { Task { await lifeCycle.onAppear() } }
            .onDisappear { Task { await lifeCycle.onDisappear() } }
    }
}
