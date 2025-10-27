//
//  ResultView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 20/10/25.
//

import SwiftUI

struct ResultView: View {
    let title: String
    let averageRating: Int
    let backToMenuAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    private let circleSize = 0.4
    
    var body: some View {
        VStack {
            Spacer()
            
            crabView
            
            VStack(spacing: 20) {
                titleText
                
                VStack {
                    completedText
                    ratingCircleView
                }
                .foregroundStyle(CustomColor.activeColor.color)
            }
            .padding()
            .banner()
            
            Spacer()
            
            backToMenuButtonView
        }
        .mainBackground()
    }
}

// MARK: - Views
private extension ResultView {
    var crabView: some View {
        Image("crab")
            .resizable()
            .scaledToFit()
            .frame(width: screenSize.width * 0.5)
    }
    
    var titleText: some View {
        Text(title)
            .subFont(size: screenSize.width * 0.07)
            .foregroundStyle(CustomColor.titleColor.color)
    }
    
    var completedText: some View {
        Text("Completed")
            .mainFont(size: screenSize.width * 0.08, scaleFactor: 1)
    }
    
    var ratingCircleView: some View {
        ZStack {
            Circle()
                .stroke(
                    CustomColor.backgroundColor.color,
                    lineWidth: 10
                )
                .frame(
                    width: screenSize.width * circleSize,
                    height: screenSize.width * circleSize
                )
                .shadow(radius: 1)
            
            Circle()
                .trim(from: 0, to: CGFloat(averageRating) / 100)
                .stroke(
                    CustomColor.activeColor.color,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .frame(
                    width: screenSize.width * circleSize,
                    height: screenSize.width * circleSize
                )
                .rotationEffect(.degrees(-90))
            
            Text("\(averageRating)%")
                .mainFont(size: screenSize.width * 0.1, scaleFactor: 1)
        }
    }
    
    var backToMenuButtonView: some View {
        Button(action: backToMenuAction) {
            Text("Back to menu")
                .mainButtonShape(
                    fontColor: CustomColor.backgroundColor.color,
                    backgroundColor: CustomColor.activeColor.color
                )
        }
        .buttonStyle(ButtonPressInStyle())
        .padding()
    }
}

#Preview {
    GeometryReader { geo in
        ResultView(title: "Variables and Mutability", averageRating: 50, backToMenuAction: {})
            .environment(\.screenSize, geo.size)
            .mainBackground()
    }
}
