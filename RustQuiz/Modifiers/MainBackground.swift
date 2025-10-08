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
            Color("backgroundColor")
                .ignoresSafeArea()
            CrabsAnimation()
            
            content
        }
    }
}

// MARK: - Test View
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
