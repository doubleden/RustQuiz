//
//  CrabView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

struct CrabView: View {
    let geometry: GeometryProxy
    let crab: Crab
    
    @State private var isAnimating = false
    
    var body: some View {
        Image("crab")
            .resizable()
            .scaledToFit()
            .opacity(0.4)
            .rotationEffect(.degrees(isAnimating ? 1.5 : -1.5))
            .frame(width: geometry.size.width * crab.size)
            .position(x: crab.x, y: crab.y)
            .animation(
                .linear(duration: 0.15)
                    .repeatForever(autoreverses: true),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    GeometryReader { g in
        CrabView(geometry: g, crab: Crab(x: g.size.width / 2, y: g.size.height / 2))
    }
}
