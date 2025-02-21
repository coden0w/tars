//
//  ViewModel.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class ViewModel<T>: ObservableObject, LifeCycle {
    
    private var _coordinator: (Coordinator)?
    public var subscriptions = [AnyCancellable]()
    
    public var coordinator: T? {
        _coordinator as? T
    }
    
    public init(coordinator: Coordinator) {
        self._coordinator = coordinator
    }
    
    open func onAppear() async {
        print("View calls onAppear \(String(describing: Self.self))")
    }
    
    open func onDisappear() async {
        print("View calls onDisappear \(String(describing: Self.self))")
    }
    
    deinit {
        print("deinit \(String(describing: Self.self))")
    }
}

extension View {
    func bind<T>(viewModel: ViewModel<T>) -> some View {
        self.bind(lifeCycle: viewModel)
    }
}
