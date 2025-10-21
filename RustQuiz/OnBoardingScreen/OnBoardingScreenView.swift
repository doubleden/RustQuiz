//
//  OnBoardingScreenView.swift
//
// Created by Denis Denisov on 26/9/25
//

import SwiftUI
import ComposableArchitecture

@ViewAction(for: OnBoardingScreenFeature.self)
struct OnBoardingScreenView: View {
    @Bindable var store: StoreOf<OnBoardingScreenFeature>
    
    @Environment(\.screenSize) private var screenSize
    private let transition = AnyTransition.asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    var body: some View {
        VStack {
            skipButton

            ZStack {
                switch store.page {
                case .welcome:
                    WelcomePage()
                        .transition(transition)
                case .quizExample:
                    QuizExamplePage()
                        .transition(transition)
                case .rustocean:
                    RustoceanPage()
                        .transition(transition)
                }
            }
            
            Spacer()
            
            nextButton
        }
        .mainBackground()
    }
}

// MARK: - SubViews
extension OnBoardingScreenView {
    var skipButton: some View {
        HStack {
            Spacer()
            Button(action: { send(.didTapSkip) }) {
                Text("Skip")
                    .subFont(size: screenSize.width * 0.05)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
    }

    
    var nextButton: some View {
        Button(action: { send(.didTapOnNextButton, animation: .linear)} ) {
            Text(store.page.buttonTitle)
                .mainButtonShape(
                    fontColor: CustomColor.backgroundColor.color,
                    backgroundColor: CustomColor.activeColor.color,
                    heightMultiplayer: 0.14
                )
        }
        .buttonStyle(ButtonPressInStyle())
        .padding()
    }
}

#Preview {
    GeometryReader { geometry in
        OnBoardingScreenView(
            store: Store(initialState: OnBoardingScreenFeature.State()) {
                OnBoardingScreenFeature()
            }
        )
        .environment(\.locale, Locale(identifier: "en"))
        .environment(\.screenSize, geometry.size)
    }
//    .environment(\.locale, Locale(identifier: "ru"))
}
