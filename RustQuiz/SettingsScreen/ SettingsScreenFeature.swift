//
//  SettingsScreenStore.swift
//
//  Created by Denis Denisov on 26/9/25
//

import Foundation
import ComposableArchitecture
import UIKit

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
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.navigateBack):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.changeLanguage):
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                return .none
                
            case .view(.getLanguageName):
                let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
                let locale = Locale(identifier: languageCode)
                state.languageName = locale.localizedString(forLanguageCode: languageCode) ?? "English"
                return .none
            }
        }
    }
}
