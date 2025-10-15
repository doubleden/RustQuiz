//
//  MainTopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct MainTopBarView: View {
    let settingsButtonAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        HStack {
            Button(action: settingsButtonAction) {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .padding(9)
                    .topBarButtonShape()
            }
            .buttonStyle(ButtonPressInStyle())
            
            Spacer()
        }
        .frame(height: screenSize.width * 0.13)
    }
}

#Preview {
    GeometryReader { geometry in
        MainTopBarView(
            settingsButtonAction: {}
        )
        .padding()
        .environment(\.screenSize, geometry.size)
    }
}
