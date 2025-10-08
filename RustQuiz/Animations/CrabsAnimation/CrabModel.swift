//
//  CrabModel.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import Foundation

struct Crab: Identifiable {
    let id = UUID()
    static let speed = 50.0
    static let size = 0.2
    
    let speed = Self.speed
    let size = Self.size
    
    var x = 0.0
    var y = 0.0
    var direction = Direction.left
}

extension Crab {
    enum Direction {
        case left
        case right
    }
}
