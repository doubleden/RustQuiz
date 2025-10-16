//
//  QuizTopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 16/10/25.
//

import SwiftUI

struct QuizTopBarView: View {
    let title: String
    let navigateBackAction: () -> Void
    let pauseAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        HStack {
            Button(action: navigateBackAction) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .topBarButtonShape()
            }
            
            Spacer()
            
            Text(title)
                .subFont(size: screenSize.width * 0.045, lineLimit: 3)
                .multilineTextAlignment(.center)
                .foregroundStyle(CustomColor.titleColor.color)
            
            Spacer()
            
            Button(action: pauseAction) {
                Image(systemName: "pause")
                    .resizable()
                    .scaledToFit()
                    .topBarButtonShape()
            }
        }
        .buttonStyle(ButtonPressInStyle())
        .padding()
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            QuizTopBarView(title: "Viriables and Mutatability", navigateBackAction: {}, pauseAction: {})
            Spacer()
        }
            .mainBackground()
            .environment(\.screenSize, geo.size)
    }
}
