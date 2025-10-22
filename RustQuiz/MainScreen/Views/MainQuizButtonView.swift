//
//  QuizButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 10/10/25.
//

import SwiftUI

struct MainQuizButtonView: View {
    let quiz: Quiz
    let action: (Quiz) -> Void
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Button(action: { action(quiz) }) {
            Text(LocalizedStringKey(stringLiteral: quiz.theme))
                .subFont(size: screenSize.width * 0.045, lineLimit: 4)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    quiz.averageRating == 100
                    ? CustomColor.backgroundColor.color
                    : CustomColor.generalFontColor.color
                )
                .padding()
                .frame(
                    width: screenSize.height * 0.19,
                    height: screenSize.height * 0.13
                )
                .background{
                    ZStack {
                        CustomColor.subElementsColor.color
                        
                        CustomColor.activeColor.color
                            .opacity(Double(quiz.averageRating) / 100.0)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 2)
        }
        .buttonStyle(ButtonPressInStyle())
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            MainQuizButtonView(
                quiz: Quiz(
                    id: UUID(),
                    theme: "Common Programming Concepts",
                    priority: 1,
                    questions: [
                        Question(id: UUID(), title: "", answers: [], descriptionText: "", descriptionLink: "", hasUserAnswered: true, isUserAnswerCorrect: true),
                        Question(id: UUID(), title: "", answers: [], descriptionText: "", descriptionLink: "", hasUserAnswered: true, isUserAnswerCorrect: false)
                    ]
                ),
                action: {_ in
                })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
    }
}

