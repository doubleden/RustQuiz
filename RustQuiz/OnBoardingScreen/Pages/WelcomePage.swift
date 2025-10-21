//
//  WelcomePage.swift
//  RustQuiz
//
//  Created by Denis Denisov on 21/10/25.
//

import SwiftUI

struct WelcomePage: View {
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack(spacing: 70) {
            title
            VStack {
                CrabAnimationView()
                    .frame(width: screenSize.width * 0.6)
                
                text
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - SubViews
extension WelcomePage {
    var title: some View {
        Text("Rust Quiz")
            .mainFont(size: screenSize.width * 0.15, scaleFactor: 1)
            .foregroundStyle(CustomColor.titleColor.color)
    }
    
    var text: some View {
        Text("Welcome future\nRustocean!")
            .mainFont(size: screenSize.width * 0.08, lineLimit: 2, scaleFactor: 1)
            .multilineTextAlignment(.center)
            .foregroundStyle(CustomColor.activeColor.color)
    }
}

#Preview {
    GeometryReader { geometry in
        WelcomePage()
            .environment(\.screenSize, geometry.size)
    }
}
