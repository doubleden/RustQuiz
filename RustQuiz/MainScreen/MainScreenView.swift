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
        ZStack {
            if store.progress == 100 {
                MainAchievView()
            }
            VStack {
                Group {
                    MainTopBarView(
                        settingsButtonAction: { send(.navigateToSettings) }
                    )
                    
                    VStack(spacing: 10) {
                        MainTitleView()
                        MainProgressView(progress: store.progress)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 25) {
                    ForEach(store.sources) { source in
                        MainSourceSectionView(
                            source: source,
                            navigateToQuizAction: { quiz in
                                send(.navigateToQuiz(quiz))
                            },
                            viewAllAction: {
                                send(.showAllQuizzesOf(source))
                            }
                        )
                    }
                }
                
                Spacer()
            }
            .padding(.vertical)
        }
        .overlay(
            ZStack {
                if let uncompletedQuiz = store.uncompletedQuiz {
                    UncompletedQuizButtonView {
                        send(.navigateToUncompletedQuiz(uncompletedQuiz)) 
                    }
                }
            }
        )
        .mainBackground()
        .sheet(
            item: $store.scope(
                state: \.allQuizzesModalViewState,
                action: \.allQuizzesModalViewAction
            ),
            content: { store in
                AllQuizzesView(store: store)
            }
        )
        .onAppear {
            print("did appear")
            send(.fetchSources)
            send(.loadUncompletedQuiz)
        }
    }
}

#Preview {
    GeometryReader { geo in
        MainScreenView(
            store: Store(initialState: MainScreenFeature.State()) {
                MainScreenFeature()
            }
        )
        .environment(\.screenSize, geo.size)
    }
}
