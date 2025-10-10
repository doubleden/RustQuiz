//
//  StorageServices.swift
//  RustQuiz
//
//  Created by Denis Denisov on 28/9/25.
//

import Foundation
import ComposableArchitecture
import SQLiteData

struct StorageService {
    var createSource: @Sendable (Source) async throws -> Void
    var readSources: @Sendable () async throws -> [Source]
    var updateSource: @Sendable (Source) async throws -> Void
    var deleteSource: @Sendable (Source) async throws -> Void
    
    var updateQuiz: @Sendable (Quiz) async throws -> Void
}

// MARK: - Live
extension StorageService: DependencyKey {
    static let liveValue: StorageService = .init(
        createSource: { source in
            @Dependency(\.defaultDatabase) var database
            try await database.write { db in
                // Сохраняем источник
                let sourceTable = SourceTable(
                    id: source.id,
                    title: source.title,
                    priority: source.priority
                )
                try SourceTable.insert{sourceTable}.execute(db)
                // Сохраняем квизы
                for quiz in source.quizzes {
                    let quizTable = QuizTable(
                        id: quiz.id,
                        theme: quiz.theme,
                        priority: quiz.priority,
                        sourceRowID: sourceTable.id
                    )
                    try QuizTable.insert{quizTable}.execute(db)
                    
                    // Сохраняем вопросы
                    for question in quiz.questions {
                        let questionTable = QuestionTable(
                            id: question.id,
                            title: question.title,
                            descriptionText: question.descriptionText,
                            descriptionLink: question.descriptionLink,
                            hasUserAnswered: question.hasUserAnswered,
                            isUserAnswerCorrect: question.isUserAnswerCorrect,
                            quizRowID: quiz.id
                        )
                        try QuestionTable.insert{questionTable}.execute(db)
                        
                        // Сохраняем ответы
                        for answer in question.answers {
                            let answerTable = AnswerTable(
                                id: answer.id,
                                title: answer.title,
                                isCorrect: answer.isCorrect,
                                questionID: question.id
                            )
                            try AnswerTable.insert{answerTable}.execute(db)
                        }
                    }
                }
            }
        },
        readSources: {
            @Dependency(\.defaultDatabase) var database
            
            return try await database.read { db in
                // Загружаем все данные за один раз
                let sources = try SourceTable.all
                    .order(by: \.priority)
                    .fetchAll(db)
                
                guard !sources.isEmpty else { return [] }
                
                let sourceIds = sources.map(\.id)
                
                // Загружаем все квизы для всех источников
                let quizzes = try QuizTable.all
                    .where { sourceIds.contains($0.sourceRowID) }
                    .order(by: \.priority)
                    .fetchAll(db)
                
                guard !quizzes.isEmpty else {
                    // Возвращаем источники без квизов
                    return sources.map { sourceTable in
                        Source(
                            id: sourceTable.id,
                            title: sourceTable.title,
                            priority: sourceTable.priority,
                            quizzes: []
                        )
                    }
                }
                
                let quizIds = quizzes.map(\.id)
                
                // Загружаем все вопросы для всех квизов
                let questions = try QuestionTable.all
                    .where { quizIds.contains($0.quizRowID) }
                    .fetchAll(db)
                
                let questionIds = questions.map(\.id)
                
                // Загружаем все ответы для всех вопросов
                let answers = questionIds.isEmpty ? [] : try AnswerTable.all
                    .where { questionIds.contains($0.questionID) }
                    .fetchAll(db)
                
                // Группируем данные в словари для быстрого доступа
                let answersByQuestion = Dictionary(grouping: answers) { $0.questionID }
                let questionsByQuiz = Dictionary(grouping: questions) { $0.quizRowID }
                let quizzesBySource = Dictionary(grouping: quizzes) { $0.sourceRowID }
                
                // Собираем полные модели
                return sources.map { sourceTable in
                    let sourceQuizzes = quizzesBySource[sourceTable.id] ?? []
                    
                    let mappedQuizzes = sourceQuizzes.map { quizTable in
                        let quizQuestions = questionsByQuiz[quizTable.id] ?? []
                        
                        let mappedQuestions = quizQuestions.map { questionTable in
                            let questionAnswers = answersByQuestion[questionTable.id] ?? []
                            
                            let mappedAnswers = questionAnswers.map { answerTable in
                                Answer(
                                    id: answerTable.id,
                                    title: answerTable.title,
                                    isCorrect: answerTable.isCorrect
                                )
                            }
                            
                            return Question(
                                id: questionTable.id,
                                title: questionTable.title,
                                answers: mappedAnswers,
                                descriptionText: questionTable.descriptionText,
                                descriptionLink: questionTable.descriptionLink,
                                hasUserAnswered: questionTable.hasUserAnswered,
                                isUserAnswerCorrect: questionTable.isUserAnswerCorrect
                            )
                        }
                        
                        return Quiz(
                            id: quizTable.id,
                            theme: quizTable.theme,
                            priority: quizTable.priority,
                            questions: mappedQuestions
                        )
                    }
                    
                    return Source(
                        id: sourceTable.id,
                        title: sourceTable.title,
                        priority: sourceTable.priority,
                        quizzes: mappedQuizzes
                    )
                }
            }
        },
        updateSource: { source in
            @Dependency(\.defaultDatabase) var database
            try await database.write { db in
                // Upsert источника
                let sourceTable = SourceTable(
                    id: source.id,
                    title: source.title,
                    priority: source.priority
                )
                try SourceTable.upsert{sourceTable}.execute(db)
                
                // Получаем существующие квизы
                let existingQuizIds = try QuizTable
                    .where { $0.sourceRowID == source.id }
                    .fetchAll(db)
                    .map(\.id)
                
                let newQuizIds = Set(source.quizzes.map(\.id))
                let existingQuizIdSet = Set(existingQuizIds)
                
                // Удаляем квизы, которых больше нет (CASCADE удалит вопросы и ответы)
                let quizzesToDelete = existingQuizIdSet.subtracting(newQuizIds)
                if !quizzesToDelete.isEmpty {
                    try QuizTable
                        .where { quizzesToDelete.contains($0.id) }
                        .delete()
                        .execute(db)
                }
                
                // Обрабатываем каждый квиз
                for quiz in source.quizzes {
                    let quizTable = QuizTable(
                        id: quiz.id,
                        theme: quiz.theme,
                        priority: quiz.priority,
                        sourceRowID: source.id
                    )
                    
                    // Upsert квиза
                    try QuizTable.upsert{quizTable}.execute(db)
                    
                    // Удаляем старые вопросы (CASCADE удалит ответы)
                    try QuestionTable
                        .where { $0.quizRowID == quiz.id }
                        .delete()
                        .execute(db)
                    
                    // Добавляем вопросы и ответы
                    for question in quiz.questions {
                        let questionTable = QuestionTable(
                            id: question.id,
                            title: question.title,
                            descriptionText: question.descriptionText,
                            descriptionLink: question.descriptionLink,
                            hasUserAnswered: question.hasUserAnswered,
                            isUserAnswerCorrect: question.isUserAnswerCorrect,
                            quizRowID: quiz.id
                        )
                        try QuestionTable.insert{questionTable}.execute(db)
                        
                        for answer in question.answers {
                            let answerTable = AnswerTable(
                                id: answer.id,
                                title: answer.title,
                                isCorrect: answer.isCorrect,
                                questionID: question.id
                            )
                            try AnswerTable.insert{answerTable}.execute(db)
                        }
                    }
                }
            }
        },
        deleteSource: { source in
            @Dependency(\.defaultDatabase) var database
            try await database.write { db in
                // Удаляем источник (CASCADE удалит все связанные данные)
                try SourceTable.where { $0.id == source.id }.delete().execute(db)
            }
        },
        updateQuiz: { quiz in
            @Dependency(\.defaultDatabase) var database
            try await database.write { db in
                for question in quiz.questions {
                    let questionTable = QuestionTable(
                        id: question.id,
                        title: question.title,
                        descriptionText: question.descriptionText,
                        descriptionLink: question.descriptionLink,
                        hasUserAnswered: question.hasUserAnswered,
                        isUserAnswerCorrect: question.isUserAnswerCorrect,
                        quizRowID: quiz.id
                    )
                    try QuestionTable.upsert{questionTable}.execute(db)
                }
            }
        }
    )
}

// MARK: - Preview
extension StorageService {
    static let previewValue: StorageService = .init(
        createSource: { _ in },
        readSources: {
            @Dependency(\.seedServicePreview) var seedServicePreview
            let book =  try await seedServicePreview.getTheBookSource()
            let patterns = try await seedServicePreview.getPatternsSource()
            return [book]
        },
        updateSource: { _ in },
        deleteSource: { _ in },
        updateQuiz: { _ in }
    )
}

// MARK: - Dependency Values
extension DependencyValues {
    var storageService: StorageService {
        get { self[StorageService.self] }
        set { self[StorageService.self] = newValue }
    }
}

