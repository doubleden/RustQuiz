//
//  Sheet.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI
extension View {
    func fullBanner() -> some View {
        modifier(FullBannerModifier())
    }
}

struct FullBannerModifier: ViewModifier {
    private let cornerRadius = 15.0
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(CustomColor.subElementsColor.color.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 4).blur(radius: 3).shadow(radius: 2)
            )
            .mask(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// MARK: - Test
fileprivate struct FullBanner: View {
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
        }
        .fullBanner()
        .padding()
        .mainBackground()
    }
}

#Preview {
    FullBanner()
}
