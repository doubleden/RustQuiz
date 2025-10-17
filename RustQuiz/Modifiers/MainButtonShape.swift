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
        fontColor: Color = CustomColor.generalFontColor.color,
        backgroundColor: Color = CustomColor.subElementsColor.color
    ) -> some View {
        modifier(
            MainButtonShapeModifier(
                fontColor: fontColor,
                backgroundColor: backgroundColor
            )
        )
    }
}

struct MainButtonShapeModifier: ViewModifier {
    var fontColor: Color
    var backgroundColor: Color
    var heightMultiplayer = 0.13
    @Environment(\.screenSize) private var screenSize
    
    func body(content: Content) -> some View {
        content
            .subFont(size: screenSize.width * 0.065)
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
                    .mainButtonShape()
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
