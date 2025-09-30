//
//  Quiz.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import Foundation

struct Quiz: Identifiable {
    let id: UUID
    var theme: String
    var priority: Int
    var questions: [Question]
}
