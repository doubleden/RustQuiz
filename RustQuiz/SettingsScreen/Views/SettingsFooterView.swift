//
//  SettingsFooterView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsFooterView: View {
    let version: String
    let showPrivacyPolicy: () -> Void
    let showTermsOfUse: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack(spacing: 15) {
            Text("version \(version)")
                .subFont(size: screenSize.width * 0.05, scaleFactor: 0.8)
                .foregroundStyle(CustomColor.footFontColor.color)
            
            VStack(spacing: 5) {
                Button(action: showPrivacyPolicy) {
                    Text("Privacy Policy")
                        .foregroundStyle(CustomColor.activeColor.color)
                        .underline(true)
                }
                
                Button(action: showTermsOfUse) {
                    Text("Terms of Use")
                        .foregroundStyle(CustomColor.activeColor.color)
                        .underline(true)
                }
            }
        }
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            Spacer()
            SettingsFooterView(version: "1.0.1", showPrivacyPolicy: {}, showTermsOfUse: {})
        }
        .padding()
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
