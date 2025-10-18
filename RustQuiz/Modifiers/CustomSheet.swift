//
//  CustomSheet.swift
//  RustQuiz
//
//  Created by Denis Denisov on 18/10/25.
//

import SwiftUI

struct Config {
    var backgroundColor: Color = Color.black.opacity(0.7)
}

extension View {
    @ViewBuilder
    func customSheet<Content: View>(
        config: Config = .init(),
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> () = {},
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(
            CustomSheetHelper(
                config: config,
                isPresented: isPresented,
                onDismiss: onDismiss,
                viewContent: content
            )
        )
    }
}

fileprivate struct CustomSheetHelper<ViewContent: View>: ViewModifier {
    var config: Config
    @Binding var isPresented: Bool
    var onDismiss: () -> ()
    @ViewBuilder var viewContent: ViewContent
    
    @State private var presentFullScreenCover = false
    @State private var animateView = false
    @Environment(\.screenSize) private var screenSize
    
    func body(content: Content) -> some View {
        let screenHeight = screenSize.height
        let animateView = animateView
        
        content
            .fullScreenCover(
                isPresented: $presentFullScreenCover,
                onDismiss: onDismiss,
                content: {
                    ZStack {
                        Rectangle()
                            .fill(config.backgroundColor)
                            .ignoresSafeArea()
                            .opacity(animateView ? 1 : 0)
                            .onTapGesture {
                                isPresented.toggle()
                            }
                        viewContent
                            .offset(
                                y: offset(
                                    screenHeight: screenHeight,
                                    animateView: animateView
                                )
                            )
                            .presentationBackground(.clear)
                            .onAppear {
                                if !animateView {
                                    withAnimation(
                                        Animation.spring(
                                            response: 0.4,
                                            dampingFraction: 0.6,
                                            blendDuration: 0.1
                                        )
                                    ) {
                                        self.animateView = true
                                    }
                                }
                            }
                            .ignoresSafeArea(.all)
                    }
                }
            )
            .onChange(of: isPresented) { _, value in
                if value {
                    toggleView(true)
                } else {
                    withAnimation(.easeInOut(duration: 0.45)) {
                        self.animateView = false
                    }
                    Task { @MainActor in
                        try? await Task.sleep(for: .seconds(0.45))
                        toggleView(false)
                    }
                }
            }
    }
}

// MARK: - Private Methods
private extension CustomSheetHelper {
    func toggleView(_ status: Bool) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
            presentFullScreenCover = status
        }
    }
    
    func offset(screenHeight: CGFloat, animateView: Bool) -> CGFloat {
        animateView ? 0 : screenHeight - 100
    }
}

