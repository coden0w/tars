//
//  SeasonsView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import SwiftUI

struct SeasonsView: View {
    
    @ObservedObject var vm: SeasonsViewModel
    
    var body: some View {
        ZStack {
            Text("Hello Seasons")
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    SeasonsView(vm: .sample)
}
