//
//  SourceSectionView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 10/10/25.
//

import SwiftUI

struct SourceSectionView: View {
    let source: Source
    let navigateToQuizAction:(Quiz) -> Void
    let viewAllAction:() -> Void
    
    var body: some View {
        VStack {
            HeaderView(
                sourceTitle: source.title,
                viewAllAction: viewAllAction
            )
            
            QuizzesScrollView(
                quizzes: source.quizzes,
                navigateToQuizAction: { quiz in
                    navigateToQuizAction(quiz)
                }
            )
        }
        .banner()
    }
}

fileprivate struct HeaderView: View {
    let sourceTitle: String
    let viewAllAction:() -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        HStack {
            Text(sourceTitle)
                .subFont(size: screenSize.width * 0.07, scaleFactor: 1)
                .foregroundColor(CustomColor.titleColor.color)
            
            Spacer()
            
            Button(action: viewAllAction) {
                Text("view all")
                    .underline()
                    .foregroundStyle(CustomColor.activeColor.color)
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

fileprivate struct QuizzesScrollView: View {
    let quizzes: [Quiz]
    let navigateToQuizAction:(Quiz) -> Void
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(quizzes) { quiz in
                    QuizButtonView(quiz: quiz, action: navigateToQuizAction)
                        .padding(.leading)
                }
            }
            .padding(.top, 2)
            .padding(.bottom)
        }
        .scrollIndicators(.hidden)
    }
}



#Preview {
    let source = Source(
        id: UUID(),
        title: "The book",
        priority: 1,
        quizzes: [
            Quiz(id: UUID(), theme: "Common Programming Concepts", priority: 1, questions: []),
            Quiz(id: UUID(), theme: "Understanding Ownership", priority: 1, questions: []),
            Quiz(id: UUID(), theme: "Using Structs to Structure Related Data", priority: 1, questions: []),
            Quiz(id: UUID(), theme: "Enums and Pattern Matching", priority: 1, questions: []),
            Quiz(id: UUID(), theme: "Managing Growing Projects with Packages, Crates, and Modules", priority: 1, questions: []),
        ]
    )
    
    return GeometryReader { geo in
        SourceSectionView(source: source, navigateToQuizAction: {_ in}, viewAllAction: {}).mainBackground().environment(\.screenSize, geo.size)
    }
}
