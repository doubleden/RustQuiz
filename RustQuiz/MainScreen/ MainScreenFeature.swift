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
        
        var progress: Int {
            guard !sources.isEmpty else { return 0 }
            let total = sources.reduce(0) { $0 + $1.averageRating }
            return Int((Double(total) / Double(sources.count)).rounded())
        }
    }
    
    enum Action: ViewAction {
        case view(View)
        case setSources([Source])
        
        @CasePathable
        enum View {
            case fetchSources
            case navigateToQuiz(Quiz)
            case navigateToSettings
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
                
            case .view(.navigateToQuiz(_)):
                // Callback MainNavigationFeature
                return .none
                
            case .view(.navigateToSettings):
                // Callback MainNavigationFeature
                return .none
                
            case .setSources(let sources):
                state.sources = sources
                return .none
                
            }
        }
    }
}
