//
//  MainRootView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 6/10/25.
//

import SwiftUI
import ComposableArchitecture

struct MainRootView: View {
    @Bindable var store: StoreOf<MainScreenFeature>
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MainRootView(store: Store(initialState: MainScreenFeature.State()) {
        MainScreenFeature()
    })
}
