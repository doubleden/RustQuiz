//
//  OnBoardingScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: OnBoardingScreenFeature.self)
struct OnBoardingScreenView: View {
    let store: StoreOf<OnBoardingScreenFeature>
    
    var body: some View {
        VStack {
            Text("OnBoardingScreenView")
            
            Button("did first launch") {
                send(.didTapOnNextButton, animation: .linear)
            }
        }
        .background{Color.black}
    }
}

#Preview {
    OnBoardingScreenView(
        store: Store(initialState: OnBoardingScreenFeature.State()) {
            OnBoardingScreenFeature()
        }
    )
    .environment(\.locale, Locale(identifier: "en"))
//    .environment(\.locale, Locale(identifier: "ru"))
}
