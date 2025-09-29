//
//  Quiz.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table
struct Quiz: Identifiable {
    let id: UUID
    var title = ""
    var priority = 0
    var themeID: Theme.ID
}

extension Quiz {
    static let withQuestions = group(by: \.id).leftJoin(Question.all) { $0.id.eq($1.quizID) }
}
