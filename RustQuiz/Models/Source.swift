//
//  Source.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Source: Identifiable, Decodable {
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
