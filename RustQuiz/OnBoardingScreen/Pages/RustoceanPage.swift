//
//  RustoceanPage.swift
//  RustQuiz
//
//  Created by Denis Denisov on 21/10/25.
//

import SwiftUI

struct RustoceanPage: View {
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                CrabAnimationView()
                    .frame(width: screenSize.width * 0.5)
                
                text
            }
            .padding()
            Spacer()
            
            rustoceanAchive
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - SubViews
extension RustoceanPage {
    var text: some View {
        Text("Study and complete all the quizzes to earn a reward and become a real rustocean!")
            .mainFont(size: screenSize.width * 0.05, lineLimit: 5, scaleFactor: 1)
            .multilineTextAlignment(.center)
            .foregroundStyle(CustomColor.generalFontColor.color)
    }
    
    var rustoceanAchive: some View {
        Image("rustoceanAchive")
            .resizable()
            .scaledToFit()
            .frame(width: screenSize.width * 0.7)
            .blur(radius: 13)
            .overlay(
                GeometryReader { geo in
                    Circle()
                        .frame(
                            width: geo.size.width * 0.7,
                            height: geo.size.width * 0.7
                        )
                        .position(
                            x: geo.size.width * 0.5,
                            y: geo.size.height * 0.5
                        )
                        .blur(radius: 10)
                        .opacity(0.3)
                }
            )
            .overlay(
                Text("?")
                    .mainFont(size: screenSize.width * 0.2, scaleFactor: 1)
                    .foregroundStyle(CustomColor.backgroundColor.color)
            )
            .padding()
            .banner()
    }
}

#Preview {
    GeometryReader { geometry in
        RustoceanPage()
            .environment(\.screenSize, geometry.size)
    }
}
