//
//  Source.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Source: Identifiable {
    let id: UUID
    var title: String
    var priority: Int
    var quizzes: [Quiz]
}

// MARK: - Localization
extension Source {
    var titleLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: title)
    }
}
