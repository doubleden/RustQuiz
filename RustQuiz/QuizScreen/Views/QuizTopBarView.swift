//
//  QuizTopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 16/10/25.
//

import SwiftUI

struct QuizTopBarView: View {
    let questions: [Question]
    let pauseAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    private var quantityOfAnsweredQuestions: Int {
        questions.filter({$0.hasUserAnswered}).count
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: pauseAction) {
                    Image(systemName: "pause")
                        .resizable()
                        .scaledToFit()
                        .topBarButtonShape()
                }
                Spacer()
                
                Text("\(quantityOfAnsweredQuestions) / \(questions.count)")
                    .subFont(size: screenSize.width * 0.06, scaleFactor: 1)
                    .foregroundStyle(CustomColor.activeColor.color)
            }
            .buttonStyle(ButtonPressInStyle())
        }
        .padding()
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
            Spacer()
        }
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
