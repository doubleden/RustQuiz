//
//  SettingsScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture

@Reducer
struct SettingsScreenFeature {
    
    @ObservableState
    struct State {
        
    }
    
    enum Action: ViewAction {
        case view(View)
        
        @CasePathable
        enum View {
            case navigateBack
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
            }
        }
    }
}
