//
//  QuizExamplePage.swift
//  RustQuiz
//
//  Created by Denis Denisov on 21/10/25.
//

import SwiftUI

struct QuizExamplePage: View {
    @Environment(\.screenSize) private var screenSize

    var body: some View {
        VStack {
            VStack {
                CrabAnimationView()
                    .frame(width: screenSize.width * 0.5)
                    
                text
            }
            .padding()
            
            Spacer()
            
            quizExample
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - SubViews
extension QuizExamplePage {
    var text: some View {
        Text("Rust language quizzes will help you reinforce the material you’ve covered and learn Rust more effectively")
            .mainFont(size: screenSize.width * 0.05, lineLimit: 5, scaleFactor: 1)
            .multilineTextAlignment(.center)
            .foregroundStyle(CustomColor.generalFontColor.color)
    }
    
    var quizExample: some View {
        Image("onBoardingQuizExample")
            .resizable()
            .scaledToFit()
            .frame(width: screenSize.width * 0.6)
            .padding()
            .banner()
    }
}

#Preview {
    GeometryReader { geometry in
        QuizExamplePage()
            .environment(\.screenSize, geometry.size)
            }
}
