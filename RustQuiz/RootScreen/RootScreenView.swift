//
//  RootScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture
import SQLiteData

@ViewAction(for: RootScreenFeature.self)
struct RootScreenView: View {
    let store: StoreOf<RootScreenFeature>
    
    var body: some View {
        ZStack {
            if store.isFirstLaunch {
                OnBoardingScreenView(
                    store: Store(initialState: store.onBoardingScreenState) {
                        OnBoardingScreenFeature()
                    }
                )
            } else {
                MainNavigationScreenView(
                    store: Store(initialState: store.mainNavigationScreenState) {
                        MainNavigationScreenFeature()
                    }
                )
            }
        }
        .onAppear {
            send(.checkDatabaseHasBeenLoaded)
        }
    }
}
