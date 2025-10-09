//
//  Banner.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI
extension View {
    func banner() -> some View {
        modifier(BannerModifier())
    }
}

struct BannerModifier: ViewModifier {
    
    private let shadowColor = Color.black.opacity(0.1)
    private let shadowRadius = 1.5
    private let shadowSpread = 3.0
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.container, edges: .horizontal)
            .background(CustomColor.backgroundColor.color.opacity(0.7))
            .overlay(
                ZStack {
                    LinearGradient(
                        colors: [shadowColor, .clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: shadowRadius + shadowSpread)
                    .frame(maxHeight: .infinity, alignment: .top)
                    LinearGradient(
                        colors: [shadowColor, .clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(height: shadowRadius + shadowSpread)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .mask(
                    Rectangle()
                )
            )
    }
}

// MARK: - Test
fileprivate struct Banner: View {
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
        }
        .banner()
        .mainBackground()
    }
}

#Preview {
    Banner()
}
