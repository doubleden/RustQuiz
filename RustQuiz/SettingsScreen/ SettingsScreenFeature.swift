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
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action: ViewAction, BindableAction {
        case view(View)
        case binding(BindingAction<State>)
        case alert(PresentationAction<Alert>)
        
        @CasePathable
        enum View {
            case getLanguageName
            case navigateBack
            case changeLanguage
            case clearProgress
            case showPrivacyPolicy
            case showTermsOfUse
        }
        enum Alert: Equatable {
            case resetData
            case cancel
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.openURL) var openURL
    @Dependency(\.storageService) var storageService
    @Dependency(\.seedService) var seedService
    
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
                state.alert = AlertState {
                    TextState("Are you sure you want to delete the data?")
                } actions: {
                    ButtonState(role: .destructive, action: .resetData) {
                        TextState("Delete")
                    }
                    ButtonState(role: .cancel, action: .cancel) {
                        TextState("Cancel")
                    }
                } message: {
                    TextState("This action cannot be undone")
                }
                return .none
                
            case .view(.showPrivacyPolicy):
                state.isPrivacyPolicyPresented = true
                return .none
                
            case .alert(.presented(.resetData)):
                return .run { _ in
                    let sources = try await storageService.readSources()
                    for source in sources {
                        try await storageService.deleteSource(source)
                    }
                    let seededSources = try await seedService.fetchSourcesFromSeedJSON()
                    for source in seededSources {
                        try await storageService.createSource(source)
                    }
                }
                
            case .alert(.presented(.cancel)):
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
