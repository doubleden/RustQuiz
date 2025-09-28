//
//  RustQuizApp.swift
//  RustQuiz
//
//  Created by Denis Denisov on 26/9/25.
//

import SwiftUI
import ComposableArchitecture
import SQLiteData
import OSLog

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
        prepareDependencies {
            do {
                $0.defaultDatabase = try appDatabase()
            } catch {
                fatalError("Failed to initialize database: \(error)")
            }
        }
    }
}

func appDatabase() throws -> any DatabaseWriter {
    @Dependency(\.context) var context
    var configuration = Configuration()
    
    #if DEBUG
    let logger = Logger(subsystem: "RustQuiz", category: "Database")
    configuration.prepareDatabase { db in
        db.trace(options: .profile) {
            if context == .preview {
                print("\($0.expandedDescription)")
            } else {
                logger.debug("\($0.expandedDescription)")
            }
        }
    }
    #endif
    
    let database = try defaultDatabase(configuration: configuration)
    
    #if DEBUG
    logger.info("open '\(database.path)'")
    #endif
    
    var migrator = DatabaseMigrator()
    
    #if DEBUG
    migrator.eraseDatabaseOnSchemaChange = true
    #endif
    
    migrator.registerMigration("Create tables") { db in
        try #sql("""
            CREATE TABLE "themes"(
                "id" TEXT NOT NULL PRIMARY KEY,
                "title" TEXT NOT NULL
            ) STRICT
            """)
            .execute(db)
    }
    
    try migrator.migrate(database)
    return database
}
