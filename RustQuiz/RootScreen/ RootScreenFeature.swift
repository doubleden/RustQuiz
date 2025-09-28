//
//  RootScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture
import SQLiteData

@Reducer
struct RootScreenFeature {
    
    @ObservableState
    struct State {
        @Shared(.appStorage("isFirstLaunch")) var isFirstLaunch = true
        var mainScreenState = MainScreenFeature.State()
        var onBoardingScreenState = OnBoardingScreenFeature.State()
        var stack = StackState<Destination.State>()
        //
//        @FetchAll(Theme.order(by: \.title)) var themes: [Theme]
        var themes: [Theme] = []
    }
    
    enum Action {
        case checkQuantityOfThemes
        case setDefaultThemes
        case setThemes([Theme])
        case mainScreenAction(MainScreenFeature.Action)
        case stackAction(StackActionOf<Destination>)
    }
    
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        Scope(state: \.mainScreenState, action: \.mainScreenAction) {
            MainScreenFeature()
        }
        
        Reduce {
            state,
            action in
            switch action {
            case .checkQuantityOfThemes:
                return .run { send in
                    let themes = try await storageService.readThemes()
                    await themes.isEmpty
                    ? send(.setDefaultThemes)
                    : send(.setThemes(themes))
                }
            case .setThemes(let themes):
                state.themes = themes
                return .none
            case .setDefaultThemes:
                print("setDefaultThemes")
                return .run { send in
                    try await storageService.createThemes()
                    await send(.checkQuantityOfThemes)
                }
            default:
                return .none
            }
        }
        .forEach(\.stack, action: \.stackAction)
    }
}

// MARK: - Enum Destination
extension RootScreenFeature {
    @Reducer
    enum Destination {
        case settings(SettingsScreenFeature)
        case quiz(QuizScreenFeature)
    }
}
