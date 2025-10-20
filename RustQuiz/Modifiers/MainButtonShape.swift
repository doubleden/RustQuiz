//
//  MainButtonShape.swift
//  RustQuiz
//
//  Created by Denis Denisov on 17/10/25.
//

import SwiftUI

import SwiftUI
extension View {
    func mainButtonShape(
        fontColor: Color,
        backgroundColor: Color,
        heightMultiplayer: Double = 0.12
    ) -> some View {
        modifier(
            MainButtonShapeModifier(
                fontColor: fontColor,
                backgroundColor: backgroundColor,
                heightMultiplayer: heightMultiplayer
            )
        )
    }
}

struct MainButtonShapeModifier: ViewModifier {
    var fontColor: Color
    var backgroundColor: Color
    var heightMultiplayer: Double
    @Environment(\.screenSize) private var screenSize
    
    func body(content: Content) -> some View {
        content
            .padding(4)
            .subFont(size: screenSize.width * 0.06, lineLimit: 3)
            .multilineTextAlignment(.center)
            .foregroundColor(fontColor)
            .frame(maxWidth: .infinity)
            .frame(height: screenSize.width * heightMultiplayer)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 2)
    }
}

struct MainButtonShape: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("var")
                    .mainButtonShape(fontColor: CustomColor.generalFontColor.color, backgroundColor: CustomColor.backgroundColor.color)
                    .environment(\.screenSize, geometry.size)
            }
            .padding()
            .mainBackground()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    MainButtonShape()
}
