//
//  QuizExpectedMarkView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 17/10/25.
//

import SwiftUI

struct QuizExpectedMarkView: View {
    let expectedMark: Int
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Text("expected mark \(expectedMark)%")
            .subFont(size: screenSize.width * 0.045)
            .foregroundStyle(CustomColor.footFontColor.color)
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            Spacer()
            QuizExpectedMarkView(expectedMark: 55)
        }
        .mainBackground()
            .environment(\.screenSize, geometry.size)
    }
}
