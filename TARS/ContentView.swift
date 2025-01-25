//
//  ContentView.swift
//  tars
//
//  Created by alex on 12/12/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Dependency private var fooUseCase: FooUseCase
    
    func test() {
        Task {
            do {
                let response = try await fooUseCase.execute("Swift 6")
                print(response)
            } catch {
                print(error)
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            test()
        }
    }
}

#Preview {
    ContentView()
}
