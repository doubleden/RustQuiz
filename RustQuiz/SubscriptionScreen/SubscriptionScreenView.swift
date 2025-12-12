//
//  SubscriptionScreenView.swift
//
// Created by Denis Denisov on 12/12/25
//

import SwiftUI
import ComposableArchitecture
import StoreKit

@ViewAction(for: SubscriptionScreenFeature.self)
struct SubscriptionScreenView: View {
    let store: StoreOf<SubscriptionScreenFeature>
    
    var body: some View {
        VStack {
            HeaderView(closeAction: { send(.close) })
            
            VStack {
                IntroView(title: store.isSubscribed ? "Premium" : "Unlock premium content")
                Spacer()
                ForEach(store.products) { product in
                    ProductRowView(product: product) {
                        send(.buySubscription(product))
                    }
                }
                
                Spacer()
            }
            .padding()
            .banner()
            .ignoresSafeArea()
        }
        .background(CustomColor.backgroundColor.color)
        .onAppear {
            send(.fetchProducts)
        }
    }
}

fileprivate struct HeaderView: View {
    let closeAction: () -> Void
    
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        ZStack {
            HStack {
                Button("close", action: closeAction)
                    .foregroundStyle(CustomColor.activeColor.color)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Subcriptions")
                    .mainFont(size: screenSize.width * 0.07)
                    .foregroundStyle(CustomColor.generalFontColor.color)
                Spacer()
            }
        }
        .padding()
    }
}

fileprivate struct IntroView: View {
    var title: String
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack {
            Image("crab")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width * 0.45)
            Text(title)
                .mainFont(size: screenSize.width * 0.1)
                .foregroundStyle(CustomColor.activeColor.color)
        }
    }
}

fileprivate struct ProductRowView: View {
    let product: Product
    let action: () -> Void
    @Environment(\.screenSize) private var screenSize
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(product.displayName)
                Spacer()
                Text(product.displayPrice)
            }
            .padding()
            .subFont(size: screenSize.width * 0.1)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(CustomColor.activeColor.color, lineWidth: 2)
            )
            Spacer()
            Button(action: action ) {
                Text(LocalizedStringKey(stringLiteral: "Buy"))
                    .mainButtonShape(
                        fontColor: CustomColor.backgroundColor.color,
                        backgroundColor: CustomColor.activeColor.color,
                        heightMultiplayer: 0.14
                    )
            }
            .buttonStyle(ButtonPressInStyle())
            .padding()
        }
    }
}

#Preview {
    GeometryReader { geo in
        ZStack {
            SubscriptionScreenView(
                store: Store(initialState: SubscriptionScreenFeature.State()) {
                    SubscriptionScreenFeature()
                }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.screenSize, geo.size)
    }
}
