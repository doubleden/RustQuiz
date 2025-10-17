//
//  CustomColor.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

enum CustomColor {
    case activeColor
    case backgroundColor
    case destructionColor
    case footFontColor
    case generalFontColor
    case subElementsColor
    case titleColor
    
    var color: Color {
        switch self {
        case .activeColor: Color("activeColor")
        case .backgroundColor: Color("backgroundColor")
        case .destructionColor: Color("destructionColor")
        case .footFontColor: Color("footFontColor")
        case .generalFontColor: Color("generalFontColor")
        case .subElementsColor: Color("subElementsColor")
        case .titleColor: Color("titleColor")
        }
    }
}
