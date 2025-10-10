//
//  QuizButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 10/10/25.
//

import SwiftUI

struct QuizButtonView: View {
    let quiz: Quiz
    let action: (Quiz) -> Void
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Button(action: { action(quiz) }) {
            Text(quiz.theme)
                .subFont(size: screenSize.width * 0.045, lineLimit: 4)
                .multilineTextAlignment(.center)
                .foregroundStyle(CustomColor.generalFontColor.color)
                .padding()
                .frame(
                    width: screenSize.width * 0.36,
                    height: screenSize.width * 0.25
                )
                .background(CustomColor.backgroundColor.color)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 4)
        }
        .buttonStyle(ButtonPressInStyle())
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            QuizButtonView(quiz: Quiz(id: UUID(), theme: "Common Programming Concepts", priority: 1, questions: []), action: {_ in})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
    }
}
