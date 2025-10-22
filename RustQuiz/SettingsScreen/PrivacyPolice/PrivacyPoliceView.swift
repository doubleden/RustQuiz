//
//  PrivacyPoliceView.swift
//  RustQuiz
//
//  Created by Denis Denisov on 22/10/25.
//

import SwiftUI

struct PrivacyPoliceView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: { isPresented.toggle() }) {
                    Text("close")
                        .foregroundStyle(CustomColor.activeColor.color)
                }
                
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Privacy Policy")
                        .font(.title)
                        .bold()
                    
                    Text("Last updated: October 22, 2025")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    Group {
                        Text("Data Collection")
                            .font(.headline)
                        
                        Text("RustQuiz does not collect, store, or transmit any personal data. All quiz progress and results are stored locally on your device only.")
                    }
                    
                    Group {
                        Text("Local Storage")
                            .font(.headline)
                        
                        Text("Your quiz progress, scores, and statistics are saved only on your device using local storage. This data is never sent to external servers or shared with third parties.")
                    }
                    
                    Group {
                        Text("Analytics")
                            .font(.headline)
                        
                        Text("We do not use any analytics, tracking, or advertising services.")
                    }
                    
                    Group {
                        Text("Contact")
                            .font(.headline)
                        
                        Text("If you have any questions about this Privacy Policy, please contact us at: [denis.denisv8701@gmail.com]")
                    }
                }
                .padding(.top)
            }
        }
        .padding()
    }
}

#Preview {
    PrivacyPoliceView(isPresented: .constant(true))
}
