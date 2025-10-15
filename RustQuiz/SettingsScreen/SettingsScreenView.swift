//
//  SettingsScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: SettingsScreenFeature.self)
struct SettingsScreenView: View {
    let store: StoreOf<SettingsScreenFeature>
    
    var body: some View {
        VStack {
            SettingsTopBarView(navigateBackAction: { send(.navigateBack) })
            SettingsTitleView()
            
            Spacer()
        }
        .mainBackground()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            SettingsScreenView(
                store: Store(initialState: SettingsScreenFeature.State()) {
                    SettingsScreenFeature()
                }
            )
        }
        .mainBackground()
        .environment(\.screenSize, geo.size)
        
    }
}
