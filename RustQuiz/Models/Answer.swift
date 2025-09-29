//
//  Answer.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table
struct Answer: Identifiable {
  let id: UUID
  var title = ""
  var isCorrect = false
  var questionID: Question.ID
}
