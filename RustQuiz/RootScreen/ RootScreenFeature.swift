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
        case delete
        case update
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
                    let theBookSource = try await seedService.getTheBookSource()
                    try await storageService.createSource(theBookSource)
                    await send(.checkQuantityOfSources)
                }
            case .delete:
                let source = state.sources.remove(at: 0)
                return .run { _ in
                    try await storageService.deleteSource(source)
                }
            case .update:
                var source = state.sources[0]
                source.title = "Updated"
                source.quizzes[0].theme = "dsdsddsd"
                return .run { [source = source] send in
                    try await storageService.updateSource(source)
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
