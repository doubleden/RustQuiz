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
            GeometryReader { geo in
                RootScreenView(
                    store: Store(
                        initialState: RootScreenFeature.State()
                    ) {
                        RootScreenFeature()
                    }
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environment(\.screenSize, geo.size)
            }
        }
    }
    
    init() {
        prepareDependencies {
            do {
                $0.defaultDatabase = try setupDatabase()
            } catch {
                fatalError("Failed to initialize database: \(error)")
            }
        }
    }
}

// MARK: - Setup Database (Scheme, Configuration, t.c.)
extension RustQuizApp {
    func setupDatabase() throws -> any DatabaseWriter {
        @Dependency(\.context) var context
        
        var configuration = Configuration()
        configuration.foreignKeysEnabled = true
        
        // Настройка логирования для отладки
        #if DEBUG
        let logger = Logger(subsystem: "RustQuiz", category: "Database")
        configuration.prepareDatabase { db in
            db.trace(options: .profile) { event in
                if context == .preview {
                    print("\(event.expandedDescription)")
                } else {
                    logger.debug("\(event.expandedDescription)")
                }
            }
        }
        #endif
        
        // Создаем базу данных
        let database = try SQLiteData.defaultDatabase(configuration: configuration)
        
        #if DEBUG
        logger.info("Database opened at: \(database.path)")
        #endif
        
        // Настройка миграций
        var migrator = DatabaseMigrator()
        
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif
        
        // Регистрация миграций
        migrator.registerMigration("Create quiz tables v2") { db in
            // Таблица источника
            try db.execute(sql: """
                CREATE TABLE IF NOT EXISTS "SourceTable" (
                    "id" TEXT PRIMARY KEY NOT NULL,
                    "title" TEXT NOT NULL,
                    "priority" INTEGER NOT NULL
                ) STRICT
                """)
            
            // Таблица квизов
            try db.execute(sql: """
                CREATE TABLE IF NOT EXISTS "QuizTable" (
                    "id" TEXT PRIMARY KEY NOT NULL,
                    "theme" TEXT NOT NULL,
                    "priority" INTEGER NOT NULL,
                    "sourceRowID" TEXT NOT NULL,
                    FOREIGN KEY ("sourceRowID") REFERENCES "SourceTable"("id") ON DELETE CASCADE
                ) STRICT
                """)
            
            // Таблица вопросов
            try db.execute(sql: """
                CREATE TABLE IF NOT EXISTS "QuestionTable" (
                    "id" TEXT PRIMARY KEY NOT NULL,
                    "title" TEXT NOT NULL,
                    "descriptionText" TEXT,
                    "descriptionLink" TEXT,
                    "hasUserAnswered" INTEGER NOT NULL DEFAULT 0,
                    "isUserAnswerCorrect" INTEGER,
                    "quizRowID" TEXT NOT NULL,
                    FOREIGN KEY ("quizRowID") REFERENCES "QuizTable"("id") ON DELETE CASCADE
                ) STRICT
                """)
            
            // Таблица ответов
            try db.execute(sql: """
                CREATE TABLE IF NOT EXISTS "AnswerTable" (
                    "id" TEXT PRIMARY KEY NOT NULL,
                    "title" TEXT NOT NULL,
                    "isCorrect" INTEGER NOT NULL DEFAULT 0,
                    "questionID" TEXT NOT NULL,
                    FOREIGN KEY ("questionID") REFERENCES "QuestionTable"("id") ON DELETE CASCADE
                ) STRICT
                """)
            
            // Создаем индексы для оптимизации
            try db.execute(sql: "CREATE INDEX IF NOT EXISTS idx_quiz_source ON QuizTable(sourceRowID)")
            try db.execute(sql: "CREATE INDEX IF NOT EXISTS idx_question_quiz ON QuestionTable(quizRowID)")
            try db.execute(sql: "CREATE INDEX IF NOT EXISTS idx_answer_question ON AnswerTable(questionID)")
        }
        
        // Применяем миграции
        try migrator.migrate(database)
        
        return database
    }
}
