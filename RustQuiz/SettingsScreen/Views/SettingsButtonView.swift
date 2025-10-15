//
//  SettingsButtonView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsButtonView: View {
    let title: String
    var description: String?
    let action: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .subFont(size: screenSize.width * 0.05, scaleFactor: 1)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                
                Spacer()
                
                HStack(spacing: 20) {
                    if let description = description {
                        Text(description)
                            .subFont(size: screenSize.width * 0.04, scaleFactor: 1)
                    }
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
            .frame(height: screenSize.width * 0.13)
            .background(CustomColor.backgroundColor.color)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 2)
        }
        .foregroundStyle(CustomColor.activeColor.color)
        .buttonStyle(ButtonPressInStyle())
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            SettingsButtonView(title: "Language", description: "English", action: {})
            SettingsButtonView(title: "Language", action: {})
        }
        .padding()
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
