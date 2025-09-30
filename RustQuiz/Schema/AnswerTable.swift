//
//  AnswerTable.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table("AnswerTable")
struct AnswerTable: Identifiable {
    let id: UUID
    var title: String
    var isCorrect: Bool
    var questionID: QuestionTable.ID
}
