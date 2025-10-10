//
//  AllQuizzesStore.swift
//
//  Created by Denis Denisov on 10/10/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct AllQuizzesFeature {
    
    @ObservableState
    struct State {
        let source: Source
    }
    
    enum Action {
        case close
        case navigateToQuiz(Quiz)
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .close:
                return .run { _ in
                    await dismiss()
                }
                
            case .navigateToQuiz(_):
                // Callback MainScreenFeature
                return .send(.close)
            }
        }
    }
}
