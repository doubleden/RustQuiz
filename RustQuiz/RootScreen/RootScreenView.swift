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
                if store.sources.isEmpty {
                    Text("Emtpy")
                } else {
                    ForEach(store.sources) { source in
                        Text(source.title)
                            .onAppear {
                                dump(source, name: "Source")
                            }
                    }
                }
            }
            //
        }
        .onAppear {
            store.send(.checkQuantityOfSources)
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
