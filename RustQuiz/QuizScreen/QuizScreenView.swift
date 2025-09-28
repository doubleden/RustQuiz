//
//  QuizScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

struct QuizScreenView: View {
    let store: StoreOf<QuizScreenFeature>
    
    var body: some View {
        VStack {
            Text("QuizScreenView")
        }
    }
}

#Preview {
    QuizScreenView(
        store: Store(initialState: QuizScreenFeature.State()) {
            QuizScreenFeature()
        }
    )
}
