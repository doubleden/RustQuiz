//
//  SourceTable.swift
//  RustQuiz
//
//  Created by Denis Denisov on 28/9/25.
//

import SQLiteData
import Foundation

@Table("SourceTable")
struct SourceTable: Identifiable {
    let id: UUID
    var title = ""
    var priority = 0
}

