//
//  QuizScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct QuizScreenFeature {
    
    @ObservableState
    struct State {
        var quiz: Quiz
    }
    
    enum Action {
        case action
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case action:
                state.quiz.questions[0].title = "did"
                return .run { [quiz = state.quiz] _ in
                    try await storageService.updateQuiz(quiz)
                }
            default:
                return .none
            }
        }
    }
}
