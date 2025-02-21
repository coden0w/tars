//
//  TabBarCoordinator.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import Combine

// MARK: - Protocol Navigations

protocol TabBarCoordinatorProtocol: Coordinator {
    func pop()
    func showCharacters()
    
}

// MARK: - Path

enum TabBarCoordinatorPath: Hashable {
    case initial
}

// MARK: - Tab

enum TabBarItem: Hashable {
    case characters
    case episodes
    case seasons
    case settings
}

// MARK: - AppCoordinator

final class TabBarCoordinator: CoordinatorImpl {
    
    // Properties
    
    @Published var path = [AnyHashable]()
    @Published var tab: TabBarItem = .characters
    
    // Initializer
    
    override init() {
        super.init()
    }
}

// MARK: - Navigations

extension TabBarCoordinator: TabBarCoordinatorProtocol {
    func pop() {
        _ = path.removeLast()
    }
    
    func showCharacters() {
        tab = .characters
    }
}

// MARK: - Extension

extension TabBarCoordinator {
    static var sample: TabBarCoordinator {
        TabBarCoordinator()
    }
}
