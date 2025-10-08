//
//  CrabModel.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import Foundation

struct Crab: Identifiable {
    let id = UUID()
    let speed: Double
    let size: Double
    let opacity: Double
    
    var x: Double
    var y: Double
    var direction: Direction
}

extension Crab {
    enum Direction {
        case left
        case right
    }
}
