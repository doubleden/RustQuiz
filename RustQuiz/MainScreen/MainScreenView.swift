//
//  MainScreenView.swift
//
// Created by Denis Denisov on 6/10/25
//

import SwiftUI
import ComposableArchitecture

struct MainScreenView: View {
    let store: StoreOf<MainScreenFeature>
    
    var body: some View {
        VStack {
            Text("MainScreenView")
        }
    }
}

#Preview {
    MainScreenView(
        store: Store(initialState: MainScreenFeature.State()) {
            MainScreenFeature()
        }
    )
}
