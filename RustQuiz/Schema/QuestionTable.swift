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
  var title = ""
    
  var descriptionText = ""
  var descriptionLink = ""
    
  var hasUserAnswered = false
  var isUserAnswerCorrect = false
    
  var quizRowID: QuizTable.ID
}

