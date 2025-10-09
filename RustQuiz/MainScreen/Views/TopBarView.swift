//
//  TopBarView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 9/10/25.
//

import SwiftUI

struct TopBarView: View {
    let settingsButtonAction: () -> Void
    
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
        .frame(minHeight: 30, idealHeight: 40, maxHeight: 50)
    }
}

#Preview {
    GeometryReader { geometry in
        TopBarView(
            settingsButtonAction: {}
        )
        .padding()
    }
}
