//
//  QuizProgressIndicator.swift
//  RustQuiz
//
//  Created by Denis Denisov on 16/10/25.
//

import SwiftUI

struct QuizProgressIndicator: View {
    let averageRating: Int
    let numberOfQuestions: Int
    let numberOfAnsweredQuestions: Int
    
    @Environment(\.screenSize) private var screenSize
    private var progress: Double {
        Double(averageRating) / 100
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(CustomColor.subElementsColor.color)
                .frame(maxWidth: .infinity)
                .frame(height: screenSize.width * 0.025)
                .overlay(
                    GeometryReader { geo in
                        Rectangle()
                            .frame(
                                width:
                                    geo.size.width * progress + 1
                            )
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 3,
                                    topTrailingRadius: 3
                                )
                            )
                    }
                )
            
            HStack {
                Text("\(numberOfQuestions) / \(numberOfAnsweredQuestions)")
                    .subFont(size: screenSize.width * 0.045)
                Spacer()
            }
            .padding()
        }
        .foregroundStyle(CustomColor.activeColor.color)
    }
}

#Preview {
    GeometryReader { geo in
        QuizProgressIndicator(averageRating: 59, numberOfQuestions: 5, numberOfAnsweredQuestions: 10)
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
