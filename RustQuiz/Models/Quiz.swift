//
//  Quiz.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Quiz: Identifiable {
    let id: UUID
    var theme: String
    var priority: Int
    var questions: [Question]
}

// MARK: - Localization
extension Quiz {
    var themeLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: theme)
    }
}
