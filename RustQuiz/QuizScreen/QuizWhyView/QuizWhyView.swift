//
//  QuizWhyView.swift
//
// Created by Denis Denisov on 17/10/25
//

import SwiftUI
import ComposableArchitecture

struct QuizWhyView: View {
    let store: StoreOf<QuizWhyFeature>
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                closeAction: { store.send(.close) },
                linkAction: { store.send(.showLink) }
            )
            DescriptionView(description: store.descriptionText)
            Spacer()
        }
        .background(CustomColor.backgroundColor.color)
    }
}

fileprivate struct HeaderView: View {
    let closeAction: () -> Void
    let linkAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        ZStack {
            HStack {
                Button("close", action: closeAction)
                    .foregroundStyle(CustomColor.activeColor.color)
                Spacer()
                Button("link", action: linkAction)
                    .foregroundStyle(CustomColor.activeColor.color)
            }
            .background(CustomColor.backgroundColor.color)
            
            HStack {
                Spacer()
                Text("Why ?")
                    .mainFont(size: screenSize.width * 0.07)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                Spacer()
            }
        }
        .padding()
    }
}

fileprivate struct DescriptionView: View {
    let description: String
    
    var body: some View {
        Text(LocalizedStringKey(stringLiteral: description))
            .subFont(size: 20, lineLimit: 10)
            .foregroundStyle(CustomColor.generalFontColor.color)
            .multilineTextAlignment(.center)
            .padding()
            .banner()
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            QuizWhyView(
                store: Store(initialState: QuizWhyFeature.State(descriptionText: "ddsdsdsd dsdsdsds dsdsdsds dsdsdsd", link: "www.google.com")) {
                    QuizWhyFeature()
                }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
    }
}
