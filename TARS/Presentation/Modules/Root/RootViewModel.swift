//
//  RootViewModel.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import Combine

final class RootViewModel: ViewModel<AppCoordinatorProtocol> {
    
    
    // MARK: - Initializer
    
    init(coordinator: AppCoordinatorProtocol) {
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Life Cycle
    
    override func onAppear() async {
        await super.onAppear()
    }
    
    override func onDisappear() async {
        await super.onDisappear()
    }
    
    func navigate() {
        self.coordinator?.endRoot()
    }
}

extension RootViewModel {
    static var sample: RootViewModel {
        return RootViewModel(coordinator: AppCoordinator.sample)
    }
}
