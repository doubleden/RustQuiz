//
//  OnBoardingScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct OnBoardingScreenFeature {
    
    @ObservableState
    struct State {
        @Shared(.appStorage("isFirstLaunch")) var isFirstLaunch = true
    }
    
    enum Action: ViewAction {
        case view(View)
        case onBoardingCompleted
        case some
        
        @CasePathable
        enum View {
            case didTapOnNextButton
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.didTapOnNextButton):
                return .none
                
            case .onBoardingCompleted:
                state.$isFirstLaunch.withLock { $0 = false }
                return .none
                
            default:
                return .none
            }
        }
    }
}
