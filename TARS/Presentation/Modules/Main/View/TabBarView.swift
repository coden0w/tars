//
//  TabBarView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selected: TabBarItem
    
    var body: some View {
        ZStack {
            HStack {
                TabBarItemView(icon: .init(systemName: "rectangle.on.rectangle.circle")!,
                               text: "Characters",
                               width: 24,
                               isSelected: selected == .characters,
                               action: { selected = .characters })
                Spacer()
                TabBarItemView(icon: .init(systemName: "rectangle.on.rectangle.circle")!,
                               text: "Episodes",
                               width: 24,
                               isSelected: selected == .episodes,
                               action: { selected = .episodes })
                Spacer()
                TabBarItemView(icon: .init(systemName: "rectangle.on.rectangle.circle")!,
                               text: "Seasons",
                               width: 24,
                               isSelected: selected == .seasons,
                               action: { selected = .seasons })
                Spacer()
                TabBarItemView(icon: .init(systemName: "rectangle.on.rectangle.circle")!,
                               text: "Settings",
                               width: 24,
                               isSelected: selected == .settings,
                               action: { selected = .settings })
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    TabBarView(selected: .constant(.characters))
}
