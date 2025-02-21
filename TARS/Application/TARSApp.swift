//
//  TARSApp.swift
//  tars
//
//  Created by alex on 12/12/24.
//

import SwiftUI

@main
struct TARSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var appCoordinator = AppCoordinator.sample
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: appCoordinator)
        }
    }
}
