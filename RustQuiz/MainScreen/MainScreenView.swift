//
//  MainScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct MainScreenView: View {
    let store: StoreOf<MainScreenFeature>
    
    var body: some View {
        VStack {
            Text("MainScreenView")
        }
        .background{Color.yellow}
    }
}

#Preview {
    MainScreenView(
        store: Store(initialState: MainScreenFeature.State()) {
            MainScreenFeature()
        }
    )
}
