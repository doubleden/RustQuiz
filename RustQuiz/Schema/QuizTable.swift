//
//  QuizTable.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import SQLiteData

@Table("QuizTable")
struct QuizTable: Identifiable {
    let id: UUID
    var theme = ""
    var priority = 0
    var sourceRowID: SourceTable.ID
}


