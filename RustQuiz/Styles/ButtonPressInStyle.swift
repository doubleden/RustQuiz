//
//  ButtonPressInStyle.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct ButtonPressInStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.linear(duration: 0.5), value: configuration.isPressed)
    }
}
