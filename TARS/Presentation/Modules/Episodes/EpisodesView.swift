//
//  EpisodesView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var vm: EpisodesViewModel
    
    var body: some View {
        ZStack {
            Text("Hello, Episodes")
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    EpisodesView(vm: .sample)
}
