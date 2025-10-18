//
//  QuizTransitionButtonsView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 18/10/25.
//

import SwiftUI

struct QuizTransitionButtonsView: View {
    let nextAction: () -> Void
    let previousAction: () -> Void
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        HStack {
            Button(action: previousAction) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            Button(action: nextAction) {
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
            }
        }
        .buttonStyle(ButtonPressInStyle())
        .foregroundStyle(CustomColor.activeColor.color)
        .frame(height: screenSize.width * 0.1)
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader { geometry in
        QuizTransitionButtonsView(nextAction: {}, previousAction: {})
            .mainBackground()
            .environment(\.screenSize, geometry.size)
    }
}
