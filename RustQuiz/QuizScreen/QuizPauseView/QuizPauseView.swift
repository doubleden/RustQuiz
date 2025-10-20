//
//  QuizPauseView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 18/10/25.
//

import SwiftUI

struct QuizPauseView: View {
    let title: String
    let continueAction: () -> Void
    let restartAction: () -> Void
    let backToMenuAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(CustomColor.backgroundColor.color)
            VStack {
                Text(LocalizedStringResource(stringLiteral: title))
                    .mainFont(
                        size: screenSize.width * 0.07,
                        lineLimit: 3,
                        scaleFactor: 0.5
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    Button(action: continueAction) {
                        Text("Continue")
                            .mainButtonShape(
                                fontColor: CustomColor.backgroundColor.color,
                                backgroundColor: CustomColor.activeColor.color
                            )
                    }
                    
                    Button(action: restartAction) {
                        Text("Restart")
                            .mainButtonShape(
                                fontColor: CustomColor.generalFontColor.color,
                                backgroundColor: CustomColor.backgroundColor.color
                            )
                    }
                    
                    Button(action: backToMenuAction) {
                        Text("Back to menu")
                            .mainButtonShape(
                                fontColor: CustomColor.generalFontColor.color,
                                backgroundColor: CustomColor.backgroundColor.color
                            )
                    }
                }
                .buttonStyle(ButtonPressInStyle())
                .padding()
                .padding(.horizontal)
                .banner()
            }
            .padding(.vertical)
        }
        .frame(maxHeight: screenSize.width * 0.9)
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            Rectangle()
                .opacity(0.7)
                .ignoresSafeArea()
            QuizPauseView(title: "Managing Growing Project with pacakes Managing Growing Project with pacakes Managing Growing Project with pacakes", continueAction: {}, restartAction: {}, backToMenuAction: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
        .mainBackground()
        
    }
}
