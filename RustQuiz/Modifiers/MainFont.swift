//
//  MainFont.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

//extension View {
//    func mainFont
//}

extension View {
    func mainFont(size: Double, scaleFactor: Double = 0.6) -> some View {
        modifier(MainFontModifier(size: size, scaleFactor: scaleFactor))
    }
}

struct MainFontModifier: ViewModifier {
    let size: Double
    let scaleFactor: Double
    
    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    "AlfaSlabOne-Regular",
                    size: size,
                    relativeTo: .largeTitle
                )
            )
            .lineLimit(1)
            .minimumScaleFactor(scaleFactor)
    }
}


// MARK: - Test
fileprivate struct MainFont: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .mainFont(size: 50)
    }
}

#Preview {
    MainFont()
}
