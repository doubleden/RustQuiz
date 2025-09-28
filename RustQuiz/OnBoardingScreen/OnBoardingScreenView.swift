//
//  OnBoardingScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct OnBoardingScreenView: View {
    let store: StoreOf<OnBoardingScreenFeature>
    
    var body: some View {
        VStack {
            Text("OnBoardingScreenView")
        }
    }
}

#Preview {
    OnBoardingScreenView(
        store: Store(initialState: OnBoardingScreenFeature.State()) {
            OnBoardingScreenFeature()
        }
    )
}
