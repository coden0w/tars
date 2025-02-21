//
//  AppCoordinator.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import Combine

// MARK: - Protocol Navigations

protocol AppCoordinatorProtocol: Coordinator {
    func endRoot()
}

// MARK: - Path

enum AppCoordinatorPath: Hashable {
    case root
    case main(TabBarCoordinatorPath)
}

// MARK: - AppCoordinator

final class AppCoordinator: CoordinatorImpl {
    
    // Properties
    
    @Published var path = [AnyHashable]()
    @Published var rootEnded: Bool = false
    
    // Initializer
    
    override init() {
        super.init()
        
    }
}

// MARK: - Navigations

extension AppCoordinator: AppCoordinatorProtocol {
    
    func endRoot() {
        self.rootEnded = true
    }
}

// MARK: - Extension

extension AppCoordinator {
    static var sample: AppCoordinator {
        AppCoordinator()
    }
}
