//
//  RootView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 17/2/25.
//

import Foundation
import SwiftUI

struct RootView: View {
    
    @ObservedObject var vm: RootViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("Hello Root")
                Button {
                    vm.navigate()
                } label: {
                    Text("navega")
                }
            }
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    RootView(vm: .sample)
}
