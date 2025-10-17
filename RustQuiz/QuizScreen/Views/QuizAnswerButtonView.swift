//
//  QuizAnswerButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 17/10/25.
//

import SwiftUI

struct QuizAnswerButtonView: View {
    let answer: Answer
    let hasUserAnswered: Bool
    let action: () -> Void
    
    var fontColor: Color {
        return hasUserAnswered
        ? CustomColor.backgroundColor.color
        : CustomColor.generalFontColor.color
    }
    
    var backgroundColor: Color {
        if hasUserAnswered && answer.isCorrect {
            CustomColor.activeColor.color
        } else if hasUserAnswered && !answer.isCorrect {
            CustomColor.destructionColor.color
        } else {
            CustomColor.subElementsColor.color
        }
    }
    
    var body: some View {
        Button(action: action) {
            Text(LocalizedStringKey(stringLiteral: answer.title))
                .mainButtonShape(
                    fontColor: fontColor,
                    backgroundColor: backgroundColor
                )
        }
        .buttonStyle(ButtonPressInStyle())
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            QuizAnswerButtonView(answer: Answer(id: UUID(), title: "var", isCorrect: false), hasUserAnswered: true, action: {})
        }
        .padding()
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
