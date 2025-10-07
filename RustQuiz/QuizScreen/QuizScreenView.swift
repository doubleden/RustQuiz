//
//  QuizScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct QuizScreenView: View {
    let store: StoreOf<QuizScreenFeature>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(store.quiz.theme)")
                ForEach(store.quiz.questions) { question in
                    Text(question.title)
                }
                Button("Change question", action: {store.send(.action)})
            }
        }
    }
}

#Preview {
    QuizScreenView(
        store: Store(initialState: QuizScreenFeature.State(quiz: Quiz(id: UUID(), theme: "", priority: 0, questions: []))) {
            QuizScreenFeature()
        }
    )
}
