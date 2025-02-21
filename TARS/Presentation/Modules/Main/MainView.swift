//
//  MainView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        ZStack {
            Text("Hello Root")
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    MainView(vm: .sample)
}
