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
            
            Image("crab")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width * 0.5)
            
            VStack(spacing: 20) {
                Text(title)
                    .subFont(size: screenSize.width * 0.07)
                    .foregroundStyle(CustomColor.titleColor.color)
                
                VStack {
                    Text("Completed")
                        .mainFont(size: screenSize.width * 0.08, scaleFactor: 1)
                    
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
                .foregroundStyle(CustomColor.activeColor.color)
            }
            .padding()
            .banner()
            
            Spacer()
            
            VStack {
                Button(action: backToMenuAction) {
                    Text("Back to menu")
                        .mainButtonShape(
                            fontColor: CustomColor.backgroundColor.color,
                            backgroundColor: CustomColor.activeColor.color
                        )
                }
                .buttonStyle(ButtonPressInStyle())
            }
            .padding()
        }
        .mainBackground()
    }
}

#Preview {
    GeometryReader { geo in
        ResultView(title: "Variables and Mutability", averageRating: 50, backToMenuAction: {})
            .environment(\.screenSize, geo.size)
            .mainBackground()
    }
}
