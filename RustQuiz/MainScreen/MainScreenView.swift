//
//  MainScreenView.swift
//
// Created by Denis Denisov on 6/10/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: MainScreenFeature.self)
struct MainScreenView: View {
    @Bindable var store: StoreOf<MainScreenFeature>
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(store.sources) { source in
                    VStack {
                        ForEach(source.quizzes) { quiz in
                            Button("Naviagte to \(quiz.theme)", action: { send(.navigateToQuiz(quiz)) })
                        }
                    }
                    Text("\(source.averageRating.formatted())")
                }
            }
        }
        .onAppear {
            send(.fetchSources)
        }
    }
}

#Preview {
    MainScreenView(
        store: Store(initialState: MainScreenFeature.State()) {
            MainScreenFeature()
        }
    )
}
