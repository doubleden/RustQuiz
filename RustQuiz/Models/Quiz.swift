//
//  Quiz.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Quiz: Identifiable, Decodable {
    let id: UUID
    var theme: String
    var priority: Int
    var questions: [Question]
}


extension Quiz {
    var averageRating: Int {
        let answered = questions.filter { $0.hasUserAnswered }
        guard !answered.isEmpty else { return 0 }
        
        let correctCount = answered.reduce(0) { $0 + ($1.isUserAnswerCorrect ? 1 : 0) }
        return Int((Double(correctCount) / Double(answered.count) * 100).rounded())
    }
}

