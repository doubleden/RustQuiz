//
//  Source.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import Foundation

struct Source: Identifiable {
    let id: UUID
    var title: String
    var priority: Int
    var quizzes: [Quiz]
}
