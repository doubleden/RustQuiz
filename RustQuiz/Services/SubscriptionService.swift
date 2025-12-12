//
//  SubscriptionService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 12/12/25.
//

import Foundation
import ComposableArchitecture
import StoreKit

enum SubscriptionStatus: Equatable {
    case subscribed(expirationDate: Date?)
    case notSubscribed
    case expired
}

enum TransactionUpdate: Equatable {
    case verified(Transaction)
    case unverified
}

struct SubscriptionService {
    var fetchProducts: @Sendable () async throws -> [Product]
    var purchase: @Sendable (Product) async throws -> Transaction?
    var restorePurchases: @Sendable () async throws -> Void
    var checkSubscriptionStatus: @Sendable () async -> SubscriptionStatus?
    var observeTransactions: @Sendable () -> AsyncStream<TransactionUpdate>
}

extension SubscriptionService: DependencyKey {
    static let liveValue: SubscriptionService = {
        let productIds: Set<String> = ["com.rustquiz.bigpath"]
        
        return SubscriptionService(
            fetchProducts: {
                try await Product.products(for: productIds)
            },
            
            purchase: { product in
                let result = try await product.purchase()
                
                switch result {
                case .success(let verification):
                    switch verification {
                    case .verified(let transaction):
                        await transaction.finish()
                        return transaction
                    case .unverified:
                        return nil
                    }
                case .userCancelled, .pending:
                    return nil
                @unknown default:
                    return nil
                }
            },
            
            restorePurchases: {
                try await AppStore.sync()
            },
            
            checkSubscriptionStatus: {
                guard let result = await Transaction.currentEntitlement(for: productIds.first!) else {
                    return .notSubscribed
                }
                
                switch result {
                case .verified(let transaction):
                    if let expirationDate = transaction.expirationDate {
                        if expirationDate > Date() {
                            return .subscribed(expirationDate: expirationDate)
                        } else {
                            return .expired
                        }
                    }
                    return .subscribed(expirationDate: nil)
                case .unverified:
                    return .notSubscribed
                }
            },
            
            observeTransactions: {
                AsyncStream { continuation in
                    let task = Task {
                        for await result in Transaction.updates {
                            switch result {
                            case .verified(let transaction):
                                await transaction.finish()
                                continuation.yield(.verified(transaction))
                            case .unverified:
                                continuation.yield(.unverified)
                            }
                        }
                    }
                    
                    continuation.onTermination = { _ in
                        task.cancel()
                    }
                }
            }
        )
    }()
}

extension DependencyValues {
    var subscriptionService: SubscriptionService {
        get { self[SubscriptionService.self] }
        set { self[SubscriptionService.self] = newValue }
    }
}
