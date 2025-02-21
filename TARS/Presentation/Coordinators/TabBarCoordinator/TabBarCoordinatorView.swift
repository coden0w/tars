//
//  TabBarCoordinatorView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import SwiftUI

struct TabBarCoordinatorView: View {
    
    @ObservedObject var coordinator: TabBarCoordinator
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack(path: $coordinator.path) {
                    currentTab()
                        .navigationDestination(for: AnyHashable.self) { hashable in
                        if let path = hashable as? TabBarCoordinatorPath {
                            buildPath(for: path)
                        } else {
                            fatalError("[TabBarCoordinatorView]: Unexpected navigation destination: \(String(describing: hashable))")
                        }
                    }
                }
                Spacer()
                TabBarView(selected: $coordinator.tab)
            }
        }
    }
}

extension TabBarCoordinatorView {
}

extension TabBarCoordinatorView {
    
    @ViewBuilder
    func buildPath(for path: TabBarCoordinatorPath) -> some View {
        switch path {
        case .initial:
            currentTab()
        }
    }
    
    @ViewBuilder
    func currentTab() -> some View {
        switch coordinator.tab {
        case .characters:
            CharactersView(vm: .init(coordinator: coordinator))
        case .episodes:
            EpisodesView(vm: .init(coordinator: coordinator))
        case .seasons:
            SeasonsView(vm: .init(coordinator: coordinator))
        case .settings:
            SettingsView(vm: .init(coordinator: coordinator))
        }
    }
}
