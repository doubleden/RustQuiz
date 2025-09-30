//
//  Answer.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import Foundation

struct Answer: Identifiable {
    let id: UUID
    var title: String
    var isCorrect = false
}
