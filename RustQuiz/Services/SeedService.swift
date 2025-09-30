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
                title: "The Book",
                priority: 1,
                quizzes: [
                    Quiz(
                        id: UUID(),
                        theme: "Common Programming Concepts",
                        priority: 1,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "What is a variable?",
                                answers: [
                                    Answer(id: UUID(),title: "let"),
                                    Answer(id: UUID(),title: "mut let"),
                                    Answer(id: UUID(),title: "var"),
                                    Answer(id: UUID(),title: "const")
                                ],
                                descriptionText: "Variable is a name that is used to refer to a value.",
                                descriptionLink: "https://doc.rust-lang.org/book/ch03-00-common-programming-concepts.html"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "Common Programming Concepts2",
                        priority: 2,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "What is a variable?2",
                                answers: [
                                    Answer(id: UUID(),title: "let2"),
                                    Answer(id: UUID(),title: "mut let2"),
                                    Answer(id: UUID(),title: "var2"),
                                    Answer(id: UUID(),title: "const2")
                                ],
                                descriptionText: "Variable is a name that is used to refer to a value.2",
                                descriptionLink: "https://doc.rust-lang.org/book/ch03-00-common-programming-concepts.html2"
                            )
                        ]
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
