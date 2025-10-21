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
        var page = Page.welcome
    }
    
    enum Action: ViewAction {
        case view(View)
        case onBoardingCompleted
        
        @CasePathable
        enum View {
            case didTapOnNextButton
            case didTapSkip
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.didTapSkip):
                return .send(.onBoardingCompleted)
                
            case .view(.didTapOnNextButton):
                switch state.page {
                case .welcome:
                    state.page = .quizExample
                    return .none
                case .quizExample:
                    state.page = .rustocean
                    return .none
                case .rustocean:
                    return .send(.onBoardingCompleted)
                }
                
            case .onBoardingCompleted:
                state.$isFirstLaunch.withLock { $0 = false }
                return .none
                
            }
        }
    }
}

extension OnBoardingScreenFeature {
    enum Page {
        case welcome, quizExample, rustocean
        
        var buttonTitle: String {
            switch self {
            case .rustocean: "Begin my path"
            default: "Next"
            }
        }
    }
}
