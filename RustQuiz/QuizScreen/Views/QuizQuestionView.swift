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
        Text(question)
            .padding(.horizontal)
            .padding(.vertical)
            .frame(minHeight: screenSize.width * 0.45)
            .subFont(size: screenSize.width * 0.09, lineLimit: 5, scaleFactor: 0.5)
            .multilineTextAlignment(.center)
            .foregroundStyle(CustomColor.generalFontColor.color)
            .banner()
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            QuizTopBarView(title: "Viriables and Mutatability", navigateBackAction: {}, pauseAction: {})
            QuizQuestionView(question: "How to mark a mutable variable?")
            Spacer()
        }
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
