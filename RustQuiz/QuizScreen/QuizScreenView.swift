//
//  QuizScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: QuizScreenFeature.self)
struct QuizScreenView: View {
    let store: StoreOf<QuizScreenFeature>
    
    var body: some View {
        VStack {
            QuizTopBarView(
                title: store.quiz.themeLocalized,
                navigateBackAction: { send(.navigateBack) },
                pauseAction: { send(.pause) }
            )
            
            QuizQuestionView(question: store.currentQuestion.titleLocalized)
            
            Spacer()
        }
        .mainBackground()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GeometryReader { geo in
        QuizScreenView(
            store: Store(
                initialState: QuizScreenFeature.State(
                    quiz: Quiz(
                        id: UUID(),
                        theme: "Viriables and Mutatability",
                        priority: 0,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "SDmlsmdlmsdd?",
                                answers: [
                                    .init(id: UUID(), title: "Yes", isCorrect: true),
                                    .init(id: UUID(), title: "no", isCorrect: false),
                                    .init(id: UUID(), title: "maybe", isCorrect: false),
                                    .init(id: UUID(), title: "none", isCorrect: false)
                                ],
                                descriptionText: "dsdsdsd",
                                descriptionLink: "sddsdsd"
                            )
                        ]
                    )
                )
            ) {
                QuizScreenFeature()
            }
        )
        .environment(\.screenSize, geo.size)
    }
}
