//
//  SubscriptionScreenStore.swift
//
//  Created by Denis Denisov on 12/12/25
//

import Foundation
import ComposableArchitecture
import StoreKit

@Reducer
struct SubscriptionScreenFeature {
    @ObservableState
    struct State {
        @Shared(.appStorage("isSubscribed")) var isSubscribed = false
        var products: [Product] = []
    }
    

    enum Action: ViewAction {
        case view(View)
        case setProducts([Product])
        case didSucceedPurchase
        case setSubscriptionStatus(SubscriptionStatus?)
        
        @CasePathable
        enum View {
            case fetchProducts
            case close
            case buySubscription(Product)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.subscriptionService) var subscriptionService
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.fetchProducts):
                return .run { send in
                    let products = try await subscriptionService.fetchProducts()
                    await send(.setProducts(products))
                }
                
            case .view(.close):
                return .run { _ in
                    await dismiss()
                }
                
            case .view(.buySubscription(let product)):
                return .run { send in
                    let _ = try await subscriptionService.purchase(product)
                    let status = await subscriptionService.checkSubscriptionStatus()
                    await send(.setSubscriptionStatus(status))
                }
                
            case .setSubscriptionStatus(let status):
                switch status {
                case .subscribed(expirationDate: let date):
                    print("Expiration date: \(String(describing: date))")
                    return .send(.didSucceedPurchase)
                case .notSubscribed:
                    print("Not subscribed")
                    return .none
                case .expired:
                    print("Expired")
                    return .none
                case .none:
                    return .none
                }
                
                
            case .didSucceedPurchase:
                state.$isSubscribed.withLock { $0 = true }
                return .none
                
            case .setProducts(let products):
                state.products = products
                return .none
            }
        }
    }
}
