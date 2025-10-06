//
//  MainScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainScreenFeature {
    
    @ObservableState
    struct State {
        var destinationStack = StackState<Destination.State>()
    }
    
    enum Action {
        case action
        case destinationStackAction(StackActionOf<Destination>)
    }
    
    var body: some Reducer<State, Action> {
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
extension MainScreenFeature {
    @Reducer
    enum Destination {
        case settings(SettingsScreenFeature)
        case quiz(QuizScreenFeature)
    }
}
