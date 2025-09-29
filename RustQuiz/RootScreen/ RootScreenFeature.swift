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
        var sources: [Source] = []
    }
    
    enum Action {
        case checkQuantityOfSources
        case setDefaultSources
        case setSources([Source])
        case mainScreenAction(MainScreenFeature.Action)
        case stackAction(StackActionOf<Destination>)
    }
    
    @Dependency(\.storageService) var storageService
    @Dependency(\.seedService) var seedService
    
    var body: some Reducer<State, Action> {
        Scope(state: \.mainScreenState, action: \.mainScreenAction) {
            MainScreenFeature()
        }
        
        Reduce {
            state,
            action in
            switch action {
            case .checkQuantityOfSources:
                return .run { send in
                    let sources = try await storageService.readSources()
                    await sources.isEmpty
                    ? send(.setDefaultSources)
                    : send(.setSources(sources))
                }
            case .setSources(let sources):
                state.sources = sources
                return .none
            case .setDefaultSources:
                print("setDefaultSources")
                return .run { send in
                    let sources = try await seedService.getDefaultSources()
                    try await storageService.createSources(sources)
                    await send(.checkQuantityOfSources)
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
