//
//  MainAchievView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 23/10/25.
//

import SwiftUI

struct MainAchievView: View {
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack {
            Image("rustoceanAchive")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: screenSize.height * 0.2)
            Spacer()
        }
        .padding(.top)
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReader { geometry in
        MainAchievView()
            .environment(\.screenSize, geometry.size)
    }
}
