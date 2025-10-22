//
//  SettingsTopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsTopBarView: View {
    let navigateBackAction: () -> Void
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: navigateBackAction) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .topBarButtonShape()
                }
                .buttonStyle(ButtonPressInStyle())
                
                Spacer()
            }
            
            Text("Settings")
                .mainFont(size: screenSize.width * 0.1, scaleFactor: 0.8)
                .foregroundStyle(CustomColor.generalFontColor.color)
                .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader { geometry in
        ZStack {
            VStack(spacing: 16) {
                SettingsTopBarView{}
            }
        }
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
