//
//  UncompletedQuizButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 27/10/25.
//

import SwiftUI

struct UncompletedQuizButtonView: View {
    let navigateToUncompletedQuizAction: () -> Void
    @Environment(\.screenSize) private var screenSize
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: navigateToUncompletedQuizAction) {
                Text("Uncompleted Quiz")
                    .mainButtonShape(fontColor: CustomColor.backgroundColor.color, backgroundColor: CustomColor.activeColor.color, heightMultiplayer: 0.085)
                    .shadow(color: CustomColor.activeColor.color, radius: isAnimating ? 7 : 1)
            }
            .frame(width: screenSize.width * 0.5)
            .padding(.bottom, 8)
        }
        .buttonStyle(ButtonPressInStyle())
        .task {
            withAnimation(.linear(duration: 0.5).repeatForever()) {
                isAnimating.toggle()
            }
        }
        
    }
}

#Preview {
    GeometryReader { geometry in
        ZStack {
            UncompletedQuizButtonView(){}
                .environment(\.screenSize, geometry.size)
        }
        .mainBackground(isAnimationOn: true)
    }
}
