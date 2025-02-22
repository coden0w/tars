//
//  SettingsView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var vm: SettingsViewModel
    
    var body: some View {
        ZStack {
            Text("Hello, Settings")
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    SettingsView(vm: .sample)
}
