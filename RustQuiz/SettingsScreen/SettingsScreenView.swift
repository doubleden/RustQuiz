//
//  SettingsScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture
import StoreKit

@ViewAction(for: SettingsScreenFeature.self)
struct SettingsScreenView: View {
    @Bindable var store: StoreOf<SettingsScreenFeature>
    @AppStorage("isCrabsAnimationOn") private var isCrabsAnimationOn = true
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        VStack {
            SettingsTopBarView(navigateBackAction: { send(.navigateBack) })
            
            VStack(spacing: -15) {
                SettingsSectionView(title: "Interface") {
                    VStack(spacing: 15) {
                        SettingsButtonView(
                            title: "Language",
                            description: store.languageName,
                            action: { send(.changeLanguage) }
                        )
                        
                        SettingsButtonView(
                            title: "Crabs Animation",
                            description: isCrabsAnimationOn ? "On" : "Off",
                            isArrowVisible: false,
                            action: { isCrabsAnimationOn.toggle() }
                        )
                    }
                    .padding()
                }
                
                SettingsSectionView(title: "App") {
                    VStack(spacing: 15) {
                        SettingsButtonView(
                            title: "Rate App",
                            action: { requestReview() }
                        )
                        
                        SettingsButtonView(
                            title: "Clear progress",
                            action: { send(.clearProgress) }
                        )
                    }
                    .padding()
                }
            }
            
            Spacer()
            
            SettingsFooterView(
                version: store.appVersion,
                showPrivacyPolicy: { send(.showPrivacyPolicy) },
                showTermsOfUse: { send(.showTermsOfUse) }
            )
        }
        .padding(.vertical)
        .mainBackground()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            send(.getLanguageName)
        }
        .sheet(isPresented: $store.isPrivacyPolicyPresented) {
            PrivacyPoliceView(isPresented: $store.isPrivacyPolicyPresented)
        }
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
