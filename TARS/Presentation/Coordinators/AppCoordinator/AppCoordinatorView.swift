//
//  AppCoordinatorView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            if !coordinator.rootEnded {
                rootView
            } else {
                mainView
            }
        }
    }
}

extension AppCoordinatorView {
    
    @ViewBuilder var rootView: some View {
        RootView(vm: .init(coordinator: coordinator))
    }
    
    @ViewBuilder var mainView: some View {
        TabBarCoordinatorView(coordinator: .init())
    }
}

extension AppCoordinatorView {
    
    @ViewBuilder
    func buildPath(for path: AppCoordinatorPath) -> some View {
        switch path {
        case .root:
            rootView
        case .main(_):
            mainView
        }
    }
}
