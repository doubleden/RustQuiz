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

extension Question: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case answers
        case descriptionText
        case descriptionLink
        case hasUserAnswered
        case isUserAnswerCorrect
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        answers = try container.decode([Answer].self, forKey: .answers)
        descriptionText = try container.decode(String.self, forKey: .descriptionText)
        descriptionLink = try container.decode(String.self, forKey: .descriptionLink)
        hasUserAnswered = try container.decode(Bool.self, forKey: .hasUserAnswered)
        isUserAnswerCorrect = try container.decode(Bool.self, forKey: .isUserAnswerCorrect)
    }
}
