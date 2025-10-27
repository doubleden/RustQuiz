//
//  DeletingIndicatorView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 27/10/25.
//

import SwiftUI

struct DeletingIndicatorView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .tint(CustomColor.activeColor.color)
                .scaleEffect(1.5)
        }
    }
}

#Preview {
    DeletingIndicatorView()
}
