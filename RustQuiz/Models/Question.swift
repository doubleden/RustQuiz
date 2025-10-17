//
//  Question.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Question: Identifiable, Decodable {
    let id: UUID
    var title: String
    var answers: [Answer]
    
    var descriptionText: String
    var descriptionLink: String
    
    var hasUserAnswered = false
    var isUserAnswerCorrect = false
}


extension Question {
    static func getNoneQuestion() -> Self {
        .init(
            id: UUID(),
            title: "None",
            answers: [],
            descriptionText: "None",
            descriptionLink: "None"
        )
    }
}
