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
            .opacity(crab.opacity)
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
        let crab = Crab(
            speed: 0.0,
            size: 0.4,
            opacity: 0.4,
            x: g.size.width / 2,
            y: g.size.height / 2,
            direction: .left
        )
        CrabView(geometry: g, crab: crab)
    }
}
