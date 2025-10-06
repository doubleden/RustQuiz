//
//  MainNavigationScreenFeature.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainNavigationScreenFeature {
    
    @ObservableState
    struct State {
        var mainScreenState = MainScreenFeature.State()
        var destinationStack = StackState<Destination.State>()
    }
    
    enum Action {
        case mainScreenAction(MainScreenFeature.Action)
        case destinationStackAction(StackActionOf<Destination>)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.mainScreenState, action: \.mainScreenAction) {
            MainScreenFeature()
        }
        
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
        .forEach(\.destinationStack, action: \.destinationStackAction)
    }
}

// MARK: - Enum Destination
extension MainNavigationScreenFeature {
    @Reducer
    enum Destination {
        case settings(SettingsScreenFeature)
        case quiz(QuizScreenFeature)
    }
}
