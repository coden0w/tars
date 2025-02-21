//
//  EpisodesViewModel.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import Combine

final class EpisodesViewModel: ViewModel<TabBarCoordinatorProtocol> {
    
    
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

extension EpisodesViewModel {
    static var sample: EpisodesViewModel {
        return EpisodesViewModel(coordinator: TabBarCoordinator.sample)
    }
}
