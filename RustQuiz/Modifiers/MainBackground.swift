//
//  MainBackground.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

extension View {
    func mainBackground(isAnimationOn: Bool = true) -> some View {
        modifier(MainBackgroundModifier(isAnimationOn: isAnimationOn))
    }
}

struct MainBackgroundModifier: ViewModifier {
    let isAnimationOn: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            CustomColor.backgroundColor.color
                .ignoresSafeArea()
            
            if isAnimationOn {
                CrabsAnimation()
            }
            
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
