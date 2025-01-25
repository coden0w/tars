//
//  FooUseCase.swift
//  Domain
//
//  Created by alexandru.robert on 25/1/25.
//

import Foundation
import Combine

final class FooUseCase: UseCase {
    
    func handle(input: String) async throws -> String {
        return "Foo \(input)"
    }
}
