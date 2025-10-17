//
//  QuizWhyViewStore.swift
//
//  Created by Denis Denisov on 17/10/25
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct QuizWhyFeature {
    
    @ObservableState
    struct State {
        let descriptionText: String
        let link: String
    }
    
    enum Action {
        case close
        case showLink
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.openURL) var openURL
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .close:
                return .run { _ in
                    await dismiss()
                }
                
            case .showLink:
                return .run { [link = state.link] _ in
                    let localizedURL = NSLocalizedString(link, comment: "")
                    if let url = URL(string: localizedURL) {
                        await openURL(url)
                    }
                }
            }
        }
    }
}
