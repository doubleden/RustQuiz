//
//  Answer.swift
//  RustQuiz
//
//  Created by Denis Denisov on 30/9/25.
//

import SwiftUI

struct Answer: Identifiable {
    let id: UUID
    var title: String
    var isCorrect = false
    var isSelected = false
}

extension Answer: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCorrect
        case isSelected
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        isCorrect = try container.decode(Bool.self, forKey: .isCorrect)
        isSelected = try container.decode(Bool.self, forKey: .isSelected)
    }
}
