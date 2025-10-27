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


extension Quiz {
    var averageRating: Int {
        let answered = questions.filter { $0.hasUserAnswered }
        guard !answered.isEmpty else { return 0 }
        
        let correctCount = answered.reduce(0) { $0 + ($1.isUserAnswerCorrect ? 1 : 0) }
        return Int((Double(correctCount) / Double(answered.count) * 100).rounded())
    }
}

extension Quiz: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case theme
        case priority
        case questions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        theme = try container.decode(String.self, forKey: .theme)
        priority = try container.decode(Int.self, forKey: .priority)
        questions = try container.decode([Question].self, forKey: .questions)
    }
}
