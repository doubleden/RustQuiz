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
    
    func body(content: Content) -> some View {
        content
            .background(CustomColor.backgroundColor.color)
            .foregroundStyle(CustomColor.activeColor.color)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 4)
    }
}

// MARK: - Test
fileprivate struct TopBarButtonShape: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                    }
                    .topBarButtonShape()
                    Spacer()
                }
                .frame(height: 50)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TopBarButtonShape()
}
