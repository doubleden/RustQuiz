//
//  MainProgressView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct MainProgressView: View {
    let progress: Int
    
    @Environment(\.screenSize) private var screenSize
    private var clampedProgress: Double {
        Double(min(max(progress, 0), 100)) / 100.0
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(CustomColor.backgroundColor.color)
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        CustomColor.activeColor.color,
                                        progress == 100
                                        ? CustomColor.activeColor.color
                                        : Color.clear
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(
                                width: geometry.size.width * clampedProgress
                            )
                            .shadow(
                                color: CustomColor.activeColor.color,
                                radius: 10,
                                x: 10
                            )
                            .modifier(ProgressShimmerEffect())
                    }
                )
                .mask {
                    RoundedRectangle(cornerRadius: 20)
                }
            
            Text("Learned \(progress)%")
                .subFont(size: 20)
                .shadow(radius: progress >= 80 ? 1 : 0)
                .foregroundStyle(
                    progress >= 80
                    ? CustomColor.backgroundColor.color
                    : CustomColor.titleColor.color
                )
        }
        .shadow(radius: 2.5)
        .frame(
            width: screenSize.width * 0.63,
            height: screenSize.width * 0.15
        )
    }
}

// MARK: - Private Modifiers
fileprivate struct ProgressShimmerEffect: ViewModifier {
    @State var isAnimating = false

    func body(content: Content) -> some View {
        ZStack {
            content
            content
                .mask(alignment: .leading) {
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundStyle(CustomColor.backgroundColor.color)
                            .frame(
                                width: isAnimating
                                ? geometry.size.width * 0.1
                                : geometry.size.width * 1.1,
                                height: geometry.size.height,
                                alignment: .leading
                            )
                            .position(
                                x: isAnimating
                                ? geometry.size.width * 0.05
                                : geometry.size.width * 0.45,
                                y: geometry.size.height * 0.5
                            )
                            .blur(radius: 25)
                    }
                }
        }
        .onAppear {
            withAnimation(
                .linear(duration: 1.5)
                .repeatForever(autoreverses: true)
            ) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        ZStack {
            VStack(spacing: 16) {
                MainProgressView(progress: 50)
            }
            .padding()
        }
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
