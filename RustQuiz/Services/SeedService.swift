//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var getDefaultSources: @Sendable () async throws -> [Source]
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getDefaultSources: {
            let theBookSourceID = UUID()
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
