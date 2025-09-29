//
//  DatabaseAppConfigurator.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import SQLiteData
import OSLog

final class DatabaseAppConfigurator {
    static let shared = DatabaseAppConfigurator()
    
    private init() {}
    
    func appDatabase() throws -> any DatabaseWriter {
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
        migrator.registerMigration("Create quiz tables") { db in
            // Таблица тем
            try #sql(
                """
                CREATE TABLE "themes" (
                    "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    "title" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "priority" INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0
                ) STRICT
                """
            )
            .execute(db)
            
            // Таблица квизов
            try #sql(
                """
                CREATE TABLE "quizzes" (
                    "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    "title" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "priority" INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0,
                    "themeID" TEXT NOT NULL REFERENCES "themes"("id") ON DELETE CASCADE
                ) STRICT
                """
            )
            .execute(db)
            
            // Таблица вопросов
            try #sql(
                """
                CREATE TABLE "questions" (
                    "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    "title" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "descriptionText" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "descriptionLink" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "hasUserAnswered" INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0,
                    "isUserAnswerCorrect" INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0,
                    "quizID" TEXT NOT NULL REFERENCES "quizzes"("id") ON DELETE CASCADE
                ) STRICT
                """
            )
            .execute(db)
            
            // Таблица ответов
            try #sql(
                """
                CREATE TABLE "answers" (
                    "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    "title" TEXT NOT NULL ON CONFLICT REPLACE DEFAULT '',
                    "isCorrect" INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0,
                    "questionID" TEXT NOT NULL REFERENCES "questions"("id") ON DELETE CASCADE
                ) STRICT
                """
            )
            .execute(db)
            
            // Создаем индексы для оптимизации
            try db.execute(sql: "CREATE INDEX idx_quizzes_themeID ON quizzes(themeID)")
            try db.execute(sql: "CREATE INDEX idx_questions_quizID ON questions(quizID)")
            try db.execute(sql: "CREATE INDEX idx_answers_questionID ON answers(questionID)")
        }
        
        // Применяем миграции
        try migrator.migrate(database)
        
        return database
    }
}
