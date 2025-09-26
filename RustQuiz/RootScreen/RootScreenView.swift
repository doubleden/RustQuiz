//
//  RootScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct RootScreenView: View {
    let store: StoreOf<RootScreenFeature>
    
    var body: some View {
        VStack {
            Text("RootScreenView")
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
