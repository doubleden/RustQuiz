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
        let previousAverageRating: Int
        @Presents var quizWhyViewState: QuizWhyFeature.State?
        var isPauseViewPresented = false
        
        var currentQuestionIndex = 0
        var currentQuestion: Question {
            guard !quiz.questions.isEmpty else {
                return Question.getNoneQuestion()
            }
            
            return quiz.questions[currentQuestionIndex]
        }
        
        init(quiz: Quiz) {
            self.quiz = quiz
            previousAverageRating = quiz.averageRating
        }
    }
    
    enum Action: ViewAction, BindableAction {
        case view(View)
        case binding(BindingAction<State>)
        case quizWhyViewAction(PresentationAction<QuizWhyFeature.Action>)
        case didAnswerQuestion(Answer)
        case showCorrectAnswer
        case checkAllQuestionsAnswered
        case updateQuiz
        
        @CasePathable
        enum View {
            case clearQuestionsCache
            case navigateBack
            case pause
            case restart
            case showQuizWhyView
            case didSelectAnswer(Answer)
            case nextQuestion
            case previousQuestion
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        
        Reduce {
            state,
            action in
            switch action {
            case .view(.clearQuestionsCache):
                for questionIndex in state.quiz.questions.indices {
                    state.quiz.questions[questionIndex].hasUserAnswered = false
                    state.quiz.questions[questionIndex].isUserAnswerCorrect = false
                    for (index, answer) in state.quiz.questions[questionIndex].answers.enumerated() {
                        if answer.isSelected {
                            state.quiz.questions[questionIndex].answers[index].isSelected = false
                        }
                    }
                }
                return .none
                
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.pause):
                state.isPauseViewPresented.toggle()
                return .none
                
            case .view(.restart):
                state.isPauseViewPresented.toggle()
                state.currentQuestionIndex = 0
                return .send(.view(.clearQuestionsCache))
                
            case .view(.showQuizWhyView):
                state.quizWhyViewState = .init(
                    descriptionText: state.currentQuestion.descriptionText,
                    link: state.currentQuestion.descriptionLink
                )
                return .none
                
            case .view(.didSelectAnswer(let answer)):
                if let answerIndex = state.currentQuestion.answers.firstIndex(where: { $0.id == answer.id }) {
                    state.quiz.questions[state.currentQuestionIndex].answers[answerIndex].isSelected = true
                }
                
                return .send(.didAnswerQuestion(answer))
                
            case .view(.nextQuestion):
                guard state.quiz.questions.count > state.currentQuestionIndex + 1 else {
                    return .none
                }
                state.currentQuestionIndex += 1
                return .none
                
            case .view(.previousQuestion):
                guard state.currentQuestionIndex > 0 else {
                    return .none
                }
                state.currentQuestionIndex -= 1
                return .none
                
            case .didAnswerQuestion(let answer):
                state.quiz.questions[state.currentQuestionIndex].hasUserAnswered = true
                state.quiz.questions[state.currentQuestionIndex].isUserAnswerCorrect = answer.isCorrect
                return answer.isCorrect
                ? .send(.checkAllQuestionsAnswered)
                : .send(.showCorrectAnswer)
                
            case .showCorrectAnswer:
                for (index, answer) in state.quiz.questions[state.currentQuestionIndex].answers.enumerated() {
                    if answer.isCorrect {
                        state.quiz.questions[state.currentQuestionIndex].answers[index].isSelected = true
                    }
                }
                return .send(.checkAllQuestionsAnswered)
                
            case .checkAllQuestionsAnswered:
                return state.quiz.questions.allSatisfy({ $0.hasUserAnswered })
                ? .send(.updateQuiz)
                : .send(.view(.nextQuestion))
                
            case .updateQuiz:
                if state.quiz.averageRating > state.previousAverageRating {
                    return .run { [quiz = state.quiz] _ in
                        try await storageService.updateQuiz(quiz)
                    }
                }
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.$quizWhyViewState, action: \.quizWhyViewAction) {
            QuizWhyFeature()
        }
    }
}
