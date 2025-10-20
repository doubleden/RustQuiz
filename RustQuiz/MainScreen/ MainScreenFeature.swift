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
        
        @CasePathable
        enum View {
            case fetchSources
            case navigateToQuiz(Quiz)
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
                    var sources = try await storageService.readSources()
                    
                    sources[0].quizzes.insert(
                        Quiz(
                        id: UUID(),
                        theme: "Test",
                        priority: 0,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "first",
                                answers: [
                                    Answer(
                                        id: UUID(),
                                        title: "correct",
                                        isCorrect: true
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                ],
                                descriptionText: "",
                                descriptionLink: ""
                            ),
                            Question(
                                id: UUID(),
                                title: "first",
                                answers: [
                                    Answer(
                                        id: UUID(),
                                        title: "correct",
                                        isCorrect: true
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                    Answer(
                                        id: UUID(),
                                        title: "incorrect",
                                        isCorrect: false
                                    ),
                                ],
                                descriptionText: "",
                                descriptionLink: ""
                            )
                        ]
                    ), at: 0)
                    
                    await send(.setSources(sources))
                }
                
            case .view(.navigateToQuiz(_)):
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
