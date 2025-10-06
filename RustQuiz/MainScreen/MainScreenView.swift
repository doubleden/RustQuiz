//
//  MainScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct MainScreenView: View {
    @Bindable var store: StoreOf<MainScreenFeature>
    
    var body: some View {
        NavigationStack(
            path: $store.scope(
                state: \.destinationStack,
                action: \.destinationStackAction
            ),
            root: {
                MainRootView(store: store)
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
    MainScreenView(
        store: Store(initialState: MainScreenFeature.State()) {
            MainScreenFeature()
        }
    )
}
