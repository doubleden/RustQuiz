//
//  QuizProgressIndicator.swift
//  RustQuiz
//
//  Created by Denis Denisov on 16/10/25.
//

import SwiftUI

struct QuizProgressIndicator: View {
    let questions: [Question]
    @Binding var transition: Transition
    @Binding var currentQuestionIndex: Int
    
    @Environment(\.screenSize) private var screenSize
    
    private var quantityOfAnsweredQuestions: Int {
        questions.filter({$0.hasUserAnswered}).count
    }
    
    private var progress: Double {
        (Double(quantityOfAnsweredQuestions) / Double(questions.count))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 2) {
                ForEach(
                    Array(questions.enumerated()),
                    id: \.offset
                ) { index, question in
                    Rectangle()
                        .fill(rectangleBackground(question: question))
                        .frame(maxWidth: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 3)
                        )
                        .shadow(radius: 1)
                        .offset(y: index == currentQuestionIndex ? -5 : 0)
                        .onTapGesture {
                            transition = index > currentQuestionIndex
                            ? .next
                            : .previous
                            withAnimation {
                                currentQuestionIndex = index
                            }
                        }
                }
            }
            .frame(height: screenSize.width * 0.05)
            .padding(.horizontal, 3)
            
            HStack {
                Text("\(quantityOfAnsweredQuestions) / \(questions.count)")
                    .subFont(size: screenSize.width * 0.045, scaleFactor: 1)
                    .foregroundStyle(CustomColor.activeColor.color)
                Spacer()
            }
            .padding()
        }
    }
}

private extension QuizProgressIndicator {
    func rectangleBackground(question: Question) -> Color {
        if question.hasUserAnswered && question.isUserAnswerCorrect {
            return CustomColor.activeColor.color
        } else if question.hasUserAnswered && !question.isUserAnswerCorrect {
            return CustomColor.destructionColor.color
        } else {
            return CustomColor.subElementsColor.color
        }
    }
}

#Preview {
    GeometryReader { geo in
        QuizProgressIndicator(
            questions: [
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
            ], transition: .constant(.next), currentQuestionIndex: .constant(0)
        )
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
