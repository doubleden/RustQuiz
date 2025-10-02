//
//  Question.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Question: Identifiable {
    let id: UUID
    var title: String
    var answers: [Answer]
    
    var descriptionText: String
    var descriptionLink: String
    
    var hasUserAnswered = false
    var isUserAnswerCorrect = false
}

// MARK: - Localization
extension Question {
    var titleLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: title)
    }
    
    var descriptionTextLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: descriptionText)
    }
    
    var descriptionLinkLocalized: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: descriptionLink)
    }
}
