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
    
    enum Action {
        case action
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
