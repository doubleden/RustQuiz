//
//  RootScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture
import SQLiteData

struct RootScreenView: View {
    let store: StoreOf<RootScreenFeature>
    
    var body: some View {
        ZStack {
            if store.isFirstLaunch {
                OnBoardingScreenView(
                    store:Store(
                        initialState: OnBoardingScreenFeature.State()
                    ) {
                        OnBoardingScreenFeature()
                    }
                )
            } else {
                MainScreenView(
                    store: store.scope(
                        state: \.mainScreenState,
                        action: \.mainScreenAction
                    )
                )
            }
            
            //
            VStack {
                Spacer()
                if store.themes.isEmpty {
                    Text("Emtpy")
                } else {
                    ForEach(store.themes) { theme in
                        Text(theme.title)
                    }
                }
            }
            //
        }
        .onAppear {
            store.send(.checkQuantityOfThemes)
        }
    }
}

#Preview {
    RootScreenView(
        store: Store(initialState: RootScreenFeature.State()) {
            RootScreenFeature()
        }
    )
}
