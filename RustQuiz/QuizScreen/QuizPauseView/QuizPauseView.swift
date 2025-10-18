//
//  QuizPauseView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 18/10/25.
//

import SwiftUI

struct QuizPauseView: View {
    @Environment(\.screenSize) private var screenSize
    let continueAction: () -> Void
    let restartAction: () -> Void
    let backToMenuAction: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(CustomColor.backgroundColor.color)
            VStack {
                HStack {
                    Spacer()
                    Text("Pause")
                        .mainFont(size: screenSize.width * 0.07, scaleFactor: 1)
                        .foregroundStyle(CustomColor.generalFontColor.color)
                    Spacer()
                }
                
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
        .frame(height: screenSize.width * 0.5)
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            Rectangle()
                .opacity(0.7)
                .ignoresSafeArea()
            QuizPauseView(continueAction: {}, restartAction: {}, backToMenuAction: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
        .mainBackground()
        
    }
}
