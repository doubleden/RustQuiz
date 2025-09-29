//
//  RustQuizApp.swift
//  RustQuiz
//
//  Created by Denis Denisov on 26/9/25.
//

import SwiftUI
import ComposableArchitecture
import SQLiteData

@main
struct RustQuizApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootScreenView(
                store: Store(
                    initialState: RootScreenFeature.State()
                ) {
                RootScreenFeature()
            })
        }
    }
    
    init() {
        let databaseConfigurator = DatabaseAppConfigurator.shared
        
        prepareDependencies {
            do {
                $0.defaultDatabase = try databaseConfigurator.appDatabase()
            } catch {
                fatalError("Failed to initialize database: \(error)")
            }
        }
    }
}
