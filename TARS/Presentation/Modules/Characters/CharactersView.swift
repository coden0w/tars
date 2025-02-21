//
//  CharactersView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import SwiftUI

struct CharactersView: View {
    
    @ObservedObject var vm: CharactersViewModel
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(edges: .all)
            Text("Hello, Characters")
        }
        .bind(lifeCycle: vm)
    }
}

#Preview {
    CharactersView(vm: .sample)
}
