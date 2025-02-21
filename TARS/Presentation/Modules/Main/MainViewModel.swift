//
//  MainViewModel.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import Combine

final class MainViewModel: ViewModel<TabBarCoordinatorProtocol> {
    
    
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

extension MainViewModel {
    static var sample: MainViewModel {
        return MainViewModel(coordinator: TabBarCoordinator.sample)
    }
}
