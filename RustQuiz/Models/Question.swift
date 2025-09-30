//
//  Question.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import Foundation

struct Question: Identifiable {
    let id: UUID
    var title: String
    var answers: [Answer]
    
    var descriptionText: String
    var descriptionLink: String
    
    var hasUserAnswered = false
    var isUserAnswerCorrect = false
    
}
