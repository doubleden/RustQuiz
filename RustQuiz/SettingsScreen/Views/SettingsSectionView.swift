//
//  SettingsSectionView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 15/10/25.
//

import SwiftUI

struct SettingsSectionView<Content: View>: View {
    let title: String
    @ViewBuilder var content: Content
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .subFont(size: screenSize.width * 0.055)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                Spacer()
            }
            
            //sheet
            content
                .padding()
                .fullBanner()
        }
        .padding()
        .frame(minHeight: 200)
        .fixedSize(horizontal: false, vertical: true)
        
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            SettingsSectionView(title: "Interface"){
                VStack {
                    Text("dsdsdsd")
                    Text("dsdsdsd")
                    Text("dsdsdsd")
                    Text("dsdsdsd")
                }
            }
        }
        .mainBackground()
        .environment(\.screenSize, geometry.size)
    }
}
