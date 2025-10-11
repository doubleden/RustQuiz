//
//  SubFont.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

extension View {
    func subFont(size: Double, lineLimit: Int = 1, scaleFactor: Double = 0.6) -> some View {
        modifier(
            SubFontModifier(
                size: size,
                lineLimit: lineLimit,
                scaleFactor: scaleFactor
            )
        )
    }
}

struct SubFontModifier: ViewModifier {
    let size: Double
    let lineLimit: Int
    let scaleFactor: Double
    
    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    "FiraSans-Regular",
                    size: size,
                    relativeTo: .title2
                )
            )
            .lineLimit(lineLimit)
            .minimumScaleFactor(scaleFactor)
    }
}



// MARK: - Test
fileprivate struct SubFont: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .subFont(size: 50)
            .foregroundStyle(Color.blue)
    }
}

#Preview {
    SubFont()
}
