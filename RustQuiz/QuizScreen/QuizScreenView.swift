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
            QuizTopBar(
                title: store.quiz.theme,
                navigateBackAction: { send(.navigateBack) },
                pauseAction: { send(.pause) }
            )
            
            Spacer()
        }
        .mainBackground()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GeometryReader { geo in
        QuizScreenView(
            store: Store(initialState: QuizScreenFeature.State(quiz: Quiz(id: UUID(), theme: "Viriables and Mutatability", priority: 0, questions: []))) {
                QuizScreenFeature()
            }
        )
        .environment(\.screenSize, geo.size)
    }
}
