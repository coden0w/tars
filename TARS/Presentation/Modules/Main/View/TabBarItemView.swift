//
//  TabBarItemView.swift
//  tars
//
//  Created by Alexandru Robert Blaga on 18/2/25.
//

import Foundation
import SwiftUI

struct TabBarItemView: View {
    
    let icon: UIImage
    let text: String
    let width: CGFloat
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(uiImage: icon)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: width)
                
                Text(text)
                    .font(.caption)
                    .foregroundStyle(isSelected ? Color.black : Color.gray)
                    .lineLimit(1)
            }
        }
        .disabled(isSelected)
    }
}

#Preview {
    TabBarItemView(icon: .init(systemName: "house")!,
                   text: "Home",
                   width: 24,
                   isSelected: true,
                   action: { print("Tap") })
}
