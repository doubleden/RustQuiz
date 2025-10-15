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
            
            VStack(spacing: -10) {
                SettingsSectionView(title: "Interface") {
                    VStack {
                        SettingsButtonView(
                            title: "Language",
                            description: "English",
                            action: { send(.changeLanguage) }
                        )
                        
                        SettingsButtonView(
                            title: "App icon",
                            description: "Standart",
                            action: {}
                        )
                    }
                    .padding()
                }
                
                SettingsSectionView(title: "App") {
                    VStack {
                        SettingsButtonView(
                            title: "Rate App",
                            action: {}
                        )
                        
                        SettingsButtonView(
                            title: "Clear progress",
                            action: {}
                        )
                    }
                    .padding()
                }
            }
            
            Spacer()
            
            SettingsFooterView(
                version: "1.0.1",
                showPrivacyPolicy: {},
                showTermsOfUse: {}
            )
            
        }
        .padding(.vertical)
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
