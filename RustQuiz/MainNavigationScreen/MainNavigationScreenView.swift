//
//  MainNavigationScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct MainNavigationScreenView: View {
    @Bindable var store: StoreOf<MainNavigationScreenFeature>
    
    var body: some View {
        NavigationStack(
            path: $store.scope(
                state: \.destinationStack,
                action: \.destinationStackAction
            ),
            root: {
                MainScreenView(
                    store: store.scope(
                        state: \.mainScreenState,
                        action: \.mainScreenAction
                    )
                )
            },
            destination: { store in
                switch store.case {
                case .settings(let settingsStore):
                    SettingsScreenView(store: settingsStore)
                case .quiz(let quizStore):
                    QuizScreenView(store: quizStore)
                }
            }
        )
    }
}

#Preview {
    MainNavigationScreenView(
        store: Store(initialState: MainNavigationScreenFeature.State()) {
            MainNavigationScreenFeature()
        }
    )
}
