//
//  MainTitleView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

struct MainTitleView: View {
    var body: some View {
        Text("Rust Quiz")
            .mainFont(size: 80)
            .foregroundStyle(CustomColor.titleColor.color)
    }
}

#Preview {
    MainTitleView()
        .padding()
}
