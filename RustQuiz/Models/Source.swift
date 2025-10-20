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


extension Source {
    var averageRating: Int {
        guard !quizzes.isEmpty else { return 0 }
        let total = quizzes.reduce(0) { $0 + $1.averageRating }
        return Int((Double(total) / Double(quizzes.count)).rounded())
    }
}

extension Source: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case priority
        case quizzes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        priority = try container.decode(Int.self, forKey: .priority)
        quizzes = try container.decode([Quiz].self, forKey: .quizzes)
    }
}
