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
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getTheBookSource: {
            Source(
                id: UUID(),
                title: "the_book",
                priority: 1,
                quizzes: [
                    Quiz(
                        id: UUID(),
                        theme: "common_programming_concepts",
                        priority: 1,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "how_are_variables_declared_by_default_in_Rust_?",
                                answers: [
                                    Answer(id: UUID(),title: "mutable", isCorrect: false),
                                    Answer(id: UUID(),title: "immutable", isCorrect: true),
                                    Answer(id: UUID(),title: "dynamic", isCorrect: false),
                                    Answer(id: UUID(),title: "by_reference", isCorrect: false)
                                ],
                                descriptionText: "let_creates_an_immutable_binding.mutability_is_only_via_mut.",
                                descriptionLink: "common_programming_concepts_link"
                            )
                        ]
                    ),
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
