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
    }
    
    enum Action: ViewAction {
        case view(View)
        
        @CasePathable
        enum View {
            case getLanguageName
            case navigateBack
            case changeLanguage
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.openURL) var openURL
    
    var body: some Reducer<State, Action> {
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
            }
        }
    }
}
