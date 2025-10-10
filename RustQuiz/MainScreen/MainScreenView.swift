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
        VStack {
            Group {
                TopBarView(settingsButtonAction: { send(.navigateToSettings) })
                
                VStack(spacing: 10) {
                    MainTitleView()
                    ProgressView(progress: store.progress)
                }
            }
            .padding()
            
            VStack {
                ForEach(store.sources) { source in
                    SourceSectionView(
                        source: source,
                        navigateToQuizAction: { quiz in
                            send(.navigateToQuiz(quiz))
                        },
                        viewAllAction: {
                            send(.showAllQuizzes(source.quizzes))
                        }
                    )
                }
            }
            .padding(.top, 40)
            
            Spacer()
        }
        .mainBackground()
        .onAppear {
            send(.fetchSources)
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
