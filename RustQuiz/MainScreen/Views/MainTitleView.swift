//
//  MainTitleView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

struct MainTitleView: View {
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Text("Rust Quiz")
            .mainFont(size: screenSize.width * 0.15, scaleFactor: 0.9)
            .foregroundStyle(CustomColor.titleColor.color)
    }
}

#Preview {
    GeometryReader { geometry in
        
        MainTitleView()
            .padding()
            .environment(\.screenSize, geometry.size)
    }
}
