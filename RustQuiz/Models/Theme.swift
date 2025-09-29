//
//  Theme.swift
//  RustQuiz
//
//  Created by Denis Denisov on 28/9/25.
//

import SQLiteData
import Foundation

@Table
struct Theme: Identifiable {
    let id: UUID
    var title = ""
    var priority = 0
}

extension Theme {
    static let withQuizzes = group(by: \.id).leftJoin(Quiz.all) { $0.id.eq($1.themeID) }
}

