//
//  QuizQuestionView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 16/10/25.
//

import SwiftUI

struct QuizQuestionView: View {
    let question: LocalizedStringKey
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack {
            Text(question)
                .padding(.horizontal)
                .padding(.vertical)
                .frame(minHeight: screenSize.width * 0.45)
                .frame(maxWidth: .infinity)
                .subFont(size: screenSize.width * 0.08, lineLimit: 10, scaleFactor: 0.3)
                .foregroundStyle(CustomColor.generalFontColor.color)
        }
        .banner()
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            QuizTopBarView(questions: [
                Question(
                    id: UUID(),
                    title: "njsnds?",
                    answers: [],
                    descriptionText: "",
                    descriptionLink: "",
                    hasUserAnswered: true,
                    isUserAnswerCorrect: true
                ),
                Question(
                    id: UUID(),
                    title: "njsnds?",
                    answers: [],
                    descriptionText: "",
                    descriptionLink: "",
                    hasUserAnswered: true,
                    isUserAnswerCorrect: false
                ),
                Question(
                    id: UUID(),
                    title: "njsnds?",
                    answers: [],
                    descriptionText: "",
                    descriptionLink: "",
                    hasUserAnswered: false,
                    isUserAnswerCorrect: false
                ),
                Question(
                    id: UUID(),
                    title: "njsnds?",
                    answers: [],
                    descriptionText: "",
                    descriptionLink: "",
                    hasUserAnswered: true,
                    isUserAnswerCorrect: true
                ),
            ], pauseAction: {})
            QuizQuestionView(question: "How to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\nHow to mark a mutable variable?\n")
            Spacer()
        }
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
