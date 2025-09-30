//
//  QuestionTable.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table("QuestionTable")
struct QuestionTable: Identifiable {
    let id: UUID
    var title: String
    
    var descriptionText: String
    var descriptionLink: String
    
    var hasUserAnswered: Bool
    var isUserAnswerCorrect: Bool
    
    var quizRowID: QuizTable.ID
}

