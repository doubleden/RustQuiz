//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var fetchSourcesFromSeedJSON: @Sendable () async throws -> [Source]
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        fetchSourcesFromSeedJSON: {
            guard let fileURL = Bundle.main.url(
                forResource: "sources",
                withExtension: "json"
            ) else {
                fatalError("Can't find the_book_source.json in sources")
            }
            

            let data = try Data(contentsOf: fileURL)
            return try await MainActor.run {
                try JSONDecoder().decode([Source].self, from: data)
            }
            
        }
    )
}

extension DependencyValues {
    var seedService: SeedService {
        get { self[SeedService.self] }
        set { self[SeedService.self] = newValue }
    }
}

#if DEBUG
extension DependencyValues {
    nonisolated var seedServicePreview: SeedService {
    get { self[SeedService.self] }
    set { self[SeedService.self] = newValue }
  }
}
#endif
