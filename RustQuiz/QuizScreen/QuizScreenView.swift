//
//  QuizScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: QuizScreenFeature.self)
struct QuizScreenView: View {
    @Bindable var store: StoreOf<QuizScreenFeature>
    
    var body: some View {
        VStack(spacing: 20) {
            QuizTopBarView(
                title: store.quiz.themeLocalized,
                navigateBackAction: { send(.navigateBack) },
                pauseAction: { send(.pause) }
            )
            
            QuizQuestionView(question: store.currentQuestion.titleLocalized)
            
            QuizProgressIndicator(
                averageRating: store.quiz.averageRating,
                numberOfQuestions: store.quiz.questions.count,
                numberOfAnsweredQuestions: store.quantityOfAnsweredQuestions
            )
            
            ForEach(store.currentQuestion.answers) { answer in
                QuizAnswerButtonView(
                    answer: answer,
                    hasUserAnswered: store.currentQuestion.hasUserAnswered,
                    action: {}
                )
            }
            .padding(.horizontal, 30)
            
            
            Spacer()
            
            VStack(spacing: 10) {
                if !store.currentQuestion.hasUserAnswered {
                    QuizWhyButtonView(action: { send(.showQuizWhyView) })
                }
                
                QuizExpectedMarkView(expectedMark: 100)
            }
        }
        .padding(.vertical)
        .mainBackground()
        .navigationBarBackButtonHidden(true)
        .sheet(
            item: $store.scope(
                state: \.quizWhyViewState,
                action: \.quizWhyViewAction
            ),
            content: { store in
                QuizWhyView(store: store)
                    .presentationDetents([.medium, .large])
            }
        )
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    if value.translation.width < 0 {
                        // Свайп влево
                        print("next question")
                    } else if value.translation.width > 0 {
                        // Свайп вправо
                        print("past question")
                    }
                }
        )
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
