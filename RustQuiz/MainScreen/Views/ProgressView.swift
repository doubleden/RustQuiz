//
//  ProgressView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct ProgressView: View {
    let progress: Int
    
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
        .shadow(radius: 3)
        .frame(minHeight: 20, idealHeight: 50, maxHeight: 60)
        .frame(maxWidth: 250)
    }
}

#Preview {
    ZStack {
        VStack(spacing: 16) {
            ProgressView(progress: 70)
        }
        .padding()
    }
    .mainBackground()
}
