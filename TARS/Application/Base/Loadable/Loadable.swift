//
//  Loadable.swift
//  tars
//
//  Created by alexandru.robert on 26/1/25.
//

import Foundation
import SwiftUI

/**
 El actor `Loadable` define la estructura básica para cualquier objeto que pueda gestionar un estado de carga.

 Los tipos que se conformen deben implementar una propiedad `isLoading` de tipo `Bool` para indicar si el proceso de carga está activo,
 y deben proporcionar métodos para iniciar y detener la carga.
 */
actor Loadable: Sendable {
    
    @MainActor private(set) var isLoading: Bool = false
    
    /**
     Inicia el proceso de carga configurando `isLoading` a `true`.
     
     Este método debe activar cualquier componente de la UI o acción asociada con un estado de carga.
     */
    func startLoading() {
        Task {
           await MainActor.run {
                self.isLoading = true
            }
        }
        
    }
    
    /**
     Detiene el proceso de carga configurando `isLoading` a `false`.
     
     Este método debe desactivar cualquier componente de la UI o acción asociada con un estado de carga.
     */
    func stopLoading() {
        Task {
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}

/**
 Extends the `View` with a method to bind a `Loadable` object to the view.

 The `bind(loadable:)` method wraps the view inside a `ZStack` and displays a `CustomLoaderView` if `isLoading` is `true`.

 - Parameter loadable: The `Loadable` object controlling the loading state.
 - Returns: A view that conditionally displays a loader over the current view.
 */
extension View {

    func bind(loadable: Loadable) -> some View {
        ZStack {
            self
            if loadable.isLoading {
                EmptyView()
                    .ignoresSafeArea()
            }
        }
    }
}
