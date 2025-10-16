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
        
        private var currentQuestionIndex = 0
        var currentQuestion: Question {
            guard !quiz.questions.isEmpty else {
                return Question.get_placeholder()
            }
            
            return quiz.questions[currentQuestionIndex]
        }
        
        
        init(quiz: Quiz) {
            self.quiz = quiz
        }
    }
    
    enum Action: ViewAction {
        case view(View)
        case updateQuiz
        
        @CasePathable
        enum View {
            case navigateBack
            case pause
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.pause):
                return .none
                
            case .updateQuiz:
                return .run { [quiz = state.quiz] _ in
                    try await storageService.updateQuiz(quiz)
                }
                
//            default:
//                return .none
            }
        }
    }
}
