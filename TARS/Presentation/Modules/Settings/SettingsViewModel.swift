//
//  SettingsViewModel.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import Combine

final class SettingsViewModel: ViewModel<TabBarCoordinatorProtocol> {
    
    
    // MARK: - Initializer
    
    init(coordinator: TabBarCoordinatorProtocol) {
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Life Cycle
    
    override func onAppear() async {
        await super.onAppear()
    }
    
    override func onDisappear() async {
        await super.onDisappear()
    }
}

extension SettingsViewModel {
    static var sample: SettingsViewModel {
        return SettingsViewModel(coordinator: TabBarCoordinator.sample)
    }
}
