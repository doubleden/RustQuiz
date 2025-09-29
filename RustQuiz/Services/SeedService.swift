//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var getDefaultThemes: @Sendable () async throws -> [Theme]
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getDefaultThemes: {
            let theBookThemeID = UUID()
            return []
        }
    )
}

extension DependencyValues {
    var seedService: SeedService {
        get { self[SeedService.self] }
        set { self[SeedService.self] = newValue }
    }
}
