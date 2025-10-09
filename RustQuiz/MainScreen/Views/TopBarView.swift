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
                    .frame(width: 30, height: 30)
            }
            .frame(width: 50, height: 50)
            .topBarButtonShape()
            
            Spacer()
        }
    }
}

#Preview {
    VStack {
        TopBarView{}
        Spacer()
    }
    .padding()
    .mainBackground()
}
