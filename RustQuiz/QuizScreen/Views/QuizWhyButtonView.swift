//
//  QuizWhyButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 17/10/25.
//

import SwiftUI

struct QuizWhyButtonView: View {
    let action: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Button(action: action) {
            Text("why?")
                .foregroundStyle(CustomColor.activeColor.color)
                .subFont(size: screenSize.width * 0.055, scaleFactor: 0.8)
                .underline()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            Spacer()
            QuizWhyButtonView(action: {})
        }
        .mainBackground()
            .environment(\.screenSize, geometry.size)
    }
}
