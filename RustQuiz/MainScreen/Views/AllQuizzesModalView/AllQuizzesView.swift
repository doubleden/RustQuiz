//
//  AllQuizzesView.swift
//
// Created by Denis Denisov on 10/10/25
//

import SwiftUI
import ComposableArchitecture

struct AllQuizzesView: View {
    let store: StoreOf<AllQuizzesFeature>
    
    var body: some View {
        VStack {
            HeaderView(
                sourceTitle: store.source.title,
                closeAction: { store.send(.close) }
            )
            
            QuizzesGridView(quizzes: store.source.quizzes) { quiz in
                store.send(.navigateToQuiz(quiz))
            }
            
        }
        .background(CustomColor.backgroundColor.color)
    }
}

fileprivate struct HeaderView: View {
    let sourceTitle: String
    let closeAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        ZStack {
            HStack {
                Button("close", action: closeAction)
                    .foregroundStyle(CustomColor.activeColor.color)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text(sourceTitle)
                    .mainFont(size: screenSize.width * 0.07)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                Spacer()
            }
        }
        .padding()
    }
}

fileprivate struct QuizzesGridView: View {
    let quizzes: [Quiz]
    let navigateToQuiz: (Quiz) -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    private var columns: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: 20), count: 2)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(quizzes) { quiz in
                    QuizButtonView(quiz: quiz) { quiz in
                        navigateToQuiz(quiz)
                    }
                    .padding(.vertical)
                }
            }
        }
        .banner()
        .ignoresSafeArea()
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
    
    GeometryReader { geo in
        ZStack {
            AllQuizzesView(
                store: Store(
                    initialState: AllQuizzesFeature.State(source: source)) {
                        AllQuizzesFeature()
                    }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
    }
}
