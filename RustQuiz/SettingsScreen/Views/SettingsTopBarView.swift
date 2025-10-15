//
//  SettingsTopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsTopBarView: View {
    let navigateBackAction: () -> Void
    
    var body: some View {
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
        .padding()
    }
}

#Preview {
    GeometryReader { geometry in
        ZStack {
            VStack(spacing: 16) {
                SettingsTopBarView{}
            }
            .padding()
        }
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
