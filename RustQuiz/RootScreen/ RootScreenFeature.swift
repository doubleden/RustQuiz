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
        var mainNavigationScreenState = MainNavigationScreenFeature.State()
        var onBoardingScreenState = OnBoardingScreenFeature.State()
    }
    
    enum Action: ViewAction {
        case view(View)
        case setSeedData
        
        @CasePathable
        enum View {
            case checkDatabaseHasBeenLoaded
        }
    }
    
    @Dependency(\.storageService) var storageService
    @Dependency(\.seedService) var seedService
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.checkDatabaseHasBeenLoaded):
                return .run { send in
                    let sources = try await storageService.readSources()
                    if sources.isEmpty {
                        await send(.setSeedData)
                    }
                }
                
            case .setSeedData:
                return .run { send in
                    let sources = try await seedService.fetchSourcesFromSeedJSON()
                    
                    for source in sources {
                        try await storageService.createSource(source)
                    }
                }
            }
        }
    }
}
