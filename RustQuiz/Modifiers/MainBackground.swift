//
//  MainBackground.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

extension View {
    func mainBackground() -> some View {
        modifier(MainBackgroundModifier())
    }
}

struct MainBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            CustomColor.backgroundColor.color
                .ignoresSafeArea()
            CrabsAnimation()
            
            content
        }
    }
}

// MARK: - Test
fileprivate struct MainBackgroundTestView: View {
    var body: some View {
        VStack {
            Text("Rust Quiz")
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .mainBackground()
    }
}

#Preview {
    MainBackgroundTestView()
}
