//
//  QuizAnswerButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 17/10/25.
//

import SwiftUI

struct QuizAnswerButtonView: View {
    let answer: Answer
    let action: () -> Void
    
    var fontColor: Color {
        return answer.isSelected
        ? CustomColor.backgroundColor.color
        : CustomColor.generalFontColor.color
    }
    
    var backgroundColor: Color {
        guard answer.isSelected else { return CustomColor.subElementsColor.color }
        
        if answer.isCorrect {
            return CustomColor.activeColor.color
        } else if !answer.isCorrect {
            return CustomColor.destructionColor.color
        } else {
            return CustomColor.subElementsColor.color
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
            QuizAnswerButtonView(answer: Answer(id: UUID(), title: "var", isCorrect: false, isSelected: true), action: {})
        }
        .padding()
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
