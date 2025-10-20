//
//  Transition.swift
//  RustQuiz
//
//  Created by Denis Denisov on 20/10/25.
//

import SwiftUI
enum Transition {
    case next
    case previous
    
    var movement: AnyTransition {
        switch self {
        case .next:
            AnyTransition.asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)
            )
        case .previous:
            AnyTransition.asymmetric(
                insertion: .move(edge: .leading),
                removal: .move(edge: .trailing)
            )
        }
    }
}
