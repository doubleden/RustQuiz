//
//  MainScreenView.swift
//
// Created by Denis Denisov on 6/10/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: MainScreenFeature.self)
struct MainScreenView: View {
    @Bindable var store: StoreOf<MainScreenFeature>
    
    var body: some View {
        VStack {
            MainTitleView()
            
            Spacer()
        }
        .padding()
        .mainBackground()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Settings") {
                    print("Settings")
                }
            }
        }
        .onAppear {
            send(.fetchSources)
        }
    }
}

#Preview {
    NavigationStack {
        MainScreenView(
            store: Store(initialState: MainScreenFeature.State()) {
                MainScreenFeature()
            }
        )
    }
}
