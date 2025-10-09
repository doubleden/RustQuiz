//
//  ScreenSizeKey.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct ScreenSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}
