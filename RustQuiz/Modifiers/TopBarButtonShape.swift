//
//  TopBarButtonShape.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

extension View {
    func topBarButtonShape() -> some View {
        modifier(TopBarButtonShapeModifier())
    }
}

struct TopBarButtonShapeModifier: ViewModifier {
    @Environment(\.screenSize) private var screenSize
    
    func body(content: Content) -> some View {
        content
            .padding(8)
            .frame(
                width: screenSize.width * 0.13,
                height: screenSize.width * 0.13
            )
            .background(CustomColor.backgroundColor.color)
            .foregroundStyle(CustomColor.activeColor.color)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 2.5)
    }
}

// MARK: - Test
fileprivate struct TopBarButtonShape: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "gear")
                                .resizable()
                                .scaledToFit()
                        }
                        .topBarButtonShape()
                        Spacer()
                    }
                    .frame(height: 50)
                    Spacer()
                }
                .padding()
            }
            .environment(\.screenSize, geometry.size)
        }
    }
}

#Preview {
    TopBarButtonShape()
}
