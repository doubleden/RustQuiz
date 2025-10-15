//
//  SettingsTitleView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsTitleView: View {
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Text("Settings")
            .mainFont(size: screenSize.width * 0.1, scaleFactor: 0.8)
            .foregroundStyle(CustomColor.generalFontColor.color)
            .padding()
            .banner()
    }
}

#Preview {
    GeometryReader { geometry in
        ZStack {
            VStack(spacing: 16) {
                SettingsTitleView()
            }
        }
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
