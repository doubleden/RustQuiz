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
    var title: String
}
