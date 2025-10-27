//
//  MainScreenStore.swift
//
//  Created by Denis Denisov on 6/10/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainScreenFeature {
    
    @ObservableState
    struct State {
        var sources: [Source] = []
        @Presents var allQuizzesModalViewState: AllQuizzesFeature.State?
        @Shared(.appStorage("uncompletedQuiz")) var uncompletedQuizData = Data()
        var uncompletedQuiz: Quiz?
        
        var progress: Int {
            guard !sources.isEmpty else { return 0 }
            let total = sources.reduce(0) { $0 + $1.averageRating }
            return Int((Double(total) / Double(sources.count)).rounded())
        }
    }
    
    enum Action: ViewAction {
        case view(View)
        case setSources([Source])
        case allQuizzesModalViewAction(PresentationAction<AllQuizzesFeature.Action>)
        case loadUncompletedQuiz
        
        @CasePathable
        enum View {
            case fetchSources
            case loadUncompletedQuiz
            case navigateToQuiz(Quiz)
            case navigateToUncompletedQuiz(Quiz)
            case navigateToSettings
            case showAllQuizzesOf(Source)
        }
    }
    
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.fetchSources):
                return .run { send in
                    let sources = try await storageService.readSources()
                    await send(.setSources(sources))
                }
                
            case .view(.loadUncompletedQuiz):
                if let quiz = try? JSONDecoder().decode(Quiz.self, from: state.uncompletedQuizData) {
                    state.uncompletedQuiz = quiz
                }
                return .none
                
            case .view(.navigateToQuiz(_)):
                // Callback MainNavigationFeature
                return .none
                
            case .view(.navigateToUncompletedQuiz(_)):
                // Callback MainNavigationFeature
                return .none
                
            case .view(.navigateToSettings):
                // Callback MainNavigationFeature
                return .none
                
            case .allQuizzesModalViewAction(.presented(.navigateToQuiz(_))):
                // Callback MainNavigationFeature
                return .none
                
            case .view(.showAllQuizzesOf(let source)):
                state.allQuizzesModalViewState = .init(source: source)
                return .none
                
            case .setSources(let sources):
                state.sources = sources
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.$allQuizzesModalViewState, action: \.allQuizzesModalViewAction) {
            AllQuizzesFeature()
        }
    }
}
