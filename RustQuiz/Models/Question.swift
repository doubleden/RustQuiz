//
//  Question.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table
struct Question: Identifiable {
  let id: UUID
  var title = ""
    
  var descriptionText = ""
  var descriptionLink = ""
    
  var hasUserAnswered = false
  var isUserAnswerCorrect = false
    
  var quizID: Quiz.ID
}

extension Question {
    static let withAnswers = group(by: \.id).leftJoin(Answer.all) { $0.id.eq($1.questionID) }
}
