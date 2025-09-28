//
//  SettingsScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct SettingsScreenView: View {
    let store: StoreOf<SettingsScreenFeature>
    
    var body: some View {
        VStack {
            Text("SettingsScreenView")
        }
    }
}

#Preview {
    SettingsScreenView(
        store: Store(initialState: SettingsScreenFeature.State()) {
            SettingsScreenFeature()
        }
    )
}
