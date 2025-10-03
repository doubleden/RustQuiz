//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var getTheBookSource: @Sendable () async throws -> Source
    var getPatternsSource: @Sendable () async throws -> Source
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getTheBookSource: {
            guard let fileURL = Bundle.main.url(
                forResource: "the_book_source",
                withExtension: "json",
                subdirectory: "SeedFilesJSON"
            ) else {
                fatalError("Can't find the_book_source.json in SeedFilesJSON")
            }
            
            do {
                let data = try Data(contentsOf: fileURL)
                return try await MainActor.run {
                    try JSONDecoder().decode(Source.self, from: data)
                }
            } catch {
                fatalError("Can't decode the_book_source.json")
            }
        },
        getPatternsSource: {
            Source(
                id: UUID(),
                title: "patterns",
                priority: 2,
                quizzes: [
                    Quiz(
                        id: UUID(),
                        theme: "patterns",
                        priority: 1,
                        questions: []
                    )
                ]
            )
        }
    )
}

extension DependencyValues {
    var seedService: SeedService {
        get { self[SeedService.self] }
        set { self[SeedService.self] = newValue }
    }
}
