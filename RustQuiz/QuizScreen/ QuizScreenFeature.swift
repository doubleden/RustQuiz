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
        
        @Presents var quizWhyViewState: QuizWhyFeature.State?
        
        private var currentQuestionIndex = 0
        var currentQuestion: Question {
            guard !quiz.questions.isEmpty else {
                return Question.get_placeholder()
            }
            
            return quiz.questions[currentQuestionIndex]
        }
        
        var quantityOfAnsweredQuestions: Int {
            quiz.questions.filter({$0.hasUserAnswered}).count
        }
        
        
        init(quiz: Quiz) {
            self.quiz = quiz
        }
    }
    
    enum Action: ViewAction {
        case view(View)
        case updateQuiz
        case quizWhyViewAction(PresentationAction<QuizWhyFeature.Action>)
        
        @CasePathable
        enum View {
            case navigateBack
            case pause
            case showQuizWhyView
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        Reduce {
            state,
            action in
            switch action {
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.pause):
                return .none
                
            case .view(.showQuizWhyView):
                state.quizWhyViewState = .init(
                    descriptionText: state.currentQuestion.descriptionText,
                    link: state.currentQuestion.descriptionLink
                )
                return .none
                
            case .updateQuiz:
                return .run { [quiz = state.quiz] _ in
                    try await storageService.updateQuiz(quiz)
                }
                
                
            default:
                return .none
            }
        }
        .ifLet(\.$quizWhyViewState, action: \.quizWhyViewAction) {
            QuizWhyFeature()
        }
    }
}
