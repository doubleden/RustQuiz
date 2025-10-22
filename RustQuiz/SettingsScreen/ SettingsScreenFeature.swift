//
//  SettingsScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct SettingsScreenFeature {
    
    @ObservableState
    struct State {
        var languageName = "None"
        var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        var isPrivacyPolicyPresented = false
    }
    
    enum Action: ViewAction, BindableAction {
        case view(View)
        case binding(BindingAction<State>)
        @CasePathable
        enum View {
            case getLanguageName
            case navigateBack
            case changeLanguage
            case clearProgress
            case showPrivacyPolicy
            case showTermsOfUse
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.openURL) var openURL
    @Dependency(\.storageService) var storageService
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.changeLanguage):
                return .run { _ in
                    guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                    await openURL(url)
                }
                
            case .view(.getLanguageName):
                let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
                let locale = Locale(identifier: languageCode)
                state.languageName = locale.localizedString(forLanguageCode: languageCode) ?? "English"
                return .none
                
            case .view(.clearProgress):
                return .run { _ in
                    
                }
                
            case .view(.showPrivacyPolicy):
                state.isPrivacyPolicyPresented = true
                return .none
                
            default:
                return .none
            }
        }
    }
}
