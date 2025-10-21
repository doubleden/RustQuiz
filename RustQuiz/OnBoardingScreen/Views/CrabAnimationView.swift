//
//  CrabAnimationView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 21/10/25.
//

import SwiftUI

struct CrabAnimationView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image("crabVec")
                .resizable()
                .scaledToFit()
                .overlay {
                    GeometryReader { geo in
                        Image("rightClaw")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.08)
                            .rotationEffect(
                                .degrees(isAnimating ? 10 : 0),
                                anchor: .bottom
                            )
                            .position(
                                x: geo.size.width * 0.998,
                                y: geo.size.height * 0.348
                            )
                    }
                }
                .overlay {
                    GeometryReader { geo in
                        Image("leftClaw")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.09)
                            .rotationEffect(
                                .degrees(isAnimating ? -15 : 0),
                                anchor: .bottom
                            )
                            .position(
                                x: -geo.size.width * 0.007,
                                y: geo.size.height * 0.4
                            )
                    }
                }
        }
        .onAppear {
            withAnimation(
                .linear(duration: 0.7)
                .repeatForever(autoreverses: true)
            ) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    CrabAnimationView()
        .padding(50)
}
