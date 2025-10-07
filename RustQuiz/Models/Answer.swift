//
//  Answer.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Answer: Identifiable, Decodable {
    let id: UUID
    var title: String
    var isCorrect = false
}

// MARK: - Properties used in view
extension Answer {
    var titleLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: title)
    }
}
