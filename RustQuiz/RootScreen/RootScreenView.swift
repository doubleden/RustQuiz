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
    @State var refresh: Bool = true
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
                if refresh {
                    if store.sources.isEmpty {
                        Text("No sources")
                    } else {
                        ForEach(store.sources) { source in
                            Text(source.title)
                                .onAppear {
                                    dump(source, name: "Source")
                                }
                        }
                    }
                }
                
                Spacer()
                Button("delete") {
                    store.send(.delete)
                }
                Button("update") {
                    store.send(.update)
                }
                Button("refresh") {
                    refresh.toggle()
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
    .environment(\.locale, Locale(identifier: "en"))
//    .environment(\.locale, Locale(identifier: "ru"))
}
