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
    @State private var transition = Transition.next
    
    var body: some View {
        VStack(spacing: 20) {
            QuizTopBarView(
                questions: store.quiz.questions,
                pauseAction: { send(.pause) }
            )
            
            VStack {
                QuizQuestionView(
                    question: LocalizedStringKey(
                        stringLiteral: store.currentQuestion.title
                    )
                )
            }
            .id(store.currentQuestion.id)
            .transition(transition.movement)
            
            QuizProgressIndicator(
                questions: store.quiz.questions,
                transition: $transition,
                currentQuestionIndex: $store.currentQuestionIndex
            )
            
            Spacer()
            
            ForEach(store.currentQuestion.answers) { answer in
                VStack {
                    QuizAnswerButtonView(
                        answer: answer,
                        action: {
                            send(.didSelectAnswer(answer), animation: .linear)
                        }
                    )
                    .disabled(store.currentQuestion.hasUserAnswered)
                    
                }
            }
            .padding(.horizontal, 30)
            .transition(transition.movement)
            
            
            Spacer()
            
            GeometryReader { geo in
                ZStack {
                    VStack(spacing: 10) {
                        if store.currentQuestion.hasUserAnswered {
                            QuizWhyButtonView(
                                action: { send(.showQuizWhyView) }
                            )
                        }
                        
                        QuizExpectedMarkView(
                            expectedMark: store.quiz.averageRating
                        )
                    }
                    
                    QuizTransitionButtonsView(
                        nextAction: {
                            transition = .next
                            send(.nextQuestion, animation: .linear)
                        },
                        previousAction: {
                            transition = .previous
                            send(.previousQuestion, animation: .linear)
                        }
                    )
                }
                .frame(height: geo.size.width * 0.15)
            }
        }
        .padding(.vertical)
        .mainBackground()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            send(.clearQuestionsCache)
        }
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
        .customSheet(isPresented: $store.isPauseViewPresented) {
            QuizPauseView(
                title: store.quiz.theme, continueAction: { send(.pause) },
                restartAction: { send(.restart) },
                backToMenuAction: { send(.navigateBack) }
            )
        }
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    if value.translation.width < 0 {
                        // Свайп влево
                        transition = .next
                        send(.nextQuestion, animation: .linear)
                    } else if value.translation.width > 0 {
                        // Свайп вправо
                        transition = .previous
                        send(.previousQuestion, animation: .linear)
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
                                descriptionLink: "sddsdsd",
                                hasUserAnswered: true,
                                isUserAnswerCorrect: true
                            ),
                            Question(
                                id: UUID(),
                                title: "333333333?",
                                answers: [
                                    .init(id: UUID(), title: "Y", isCorrect: true),
                                    .init(id: UUID(), title: "o", isCorrect: false),
                                    .init(id: UUID(), title: "2", isCorrect: false),
                                    .init(id: UUID(), title: "3", isCorrect: false)
                                ],
                                descriptionText: "dsdsdsd",
                                descriptionLink: "sddsdsd",
                                hasUserAnswered: true,
                                isUserAnswerCorrect: true
                            ),
                            Question(
                                id: UUID(),
                                title: "222222?",
                                answers: [
                                    .init(id: UUID(), title: "Y1", isCorrect: true),
                                    .init(id: UUID(), title: "o2", isCorrect: false),
                                    .init(id: UUID(), title: "24", isCorrect: false),
                                    .init(id: UUID(), title: "36", isCorrect: false)
                                ],
                                descriptionText: "dsdsdsd",
                                descriptionLink: "sddsdsd",
                                hasUserAnswered: true,
                                isUserAnswerCorrect: true
                            )
                        ],
                    )
                )
            ) {
                QuizScreenFeature()
            }
        )
        .environment(\.screenSize, geo.size)
    }
}
