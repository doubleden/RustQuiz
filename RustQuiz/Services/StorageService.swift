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
}

extension StorageService: DependencyKey {
    
    // MARK: - Live
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
            
//            try await database.write { db in
//                // Вся операция в одной транзакции
//                
//                // Обновляем источник
//                let sourceTable = SourceTable(
//                    id: source.id,
//                    title: source.title,
//                    priority: source.priority
//                )
//                try SourceTable.update(sourceTable).execute(db)
//                
//                // Получаем существующие квизы для сравнения
//                let existingQuizIds = try QuizTable.all
//                    .where { $0.sourceRowID == source.id }
//                    .select(\.id)
//                    .fetchAll(db)
//                
//                let newQuizIds = Set(source.quizzes.map(\.id))
//                let existingQuizIdSet = Set(existingQuizIds)
//                
//                // Удаляем квизы, которых больше нет
//                let quizzesToDelete = existingQuizIdSet.subtracting(newQuizIds)
//                if !quizzesToDelete.isEmpty {
//                    // Удаляем ответы для удаляемых квизов
//                    try AnswerTable.all
//                        .where { answer in
//                            QuestionTable.all
//                                .where { quizzesToDelete.contains($0.quizRowID) }
//                                .select(\.id)
//                                .contains(answer.questionID)
//                        }
//                        .deleteAll(db)
//                    
//                    // Удаляем вопросы для удаляемых квизов
//                    try QuestionTable.all
//                        .where { quizzesToDelete.contains($0.quizRowID) }
//                        .deleteAll(db)
//                    
//                    // Удаляем сами квизы
//                    try QuizTable.all
//                        .where { quizzesToDelete.contains($0.id) }
//                        .deleteAll(db)
//                }
//                
//                // Обрабатываем каждый квиз
//                for quiz in source.quizzes {
//                    let quizTable = QuizTable(
//                        id: quiz.id,
//                        theme: quiz.theme,
//                        priority: quiz.priority,
//                        sourceRowID: source.id
//                    )
//                    
//                    if existingQuizIdSet.contains(quiz.id) {
//                        // Обновляем существующий квиз
//                        try QuizTable.update(quizTable).execute(db)
//                        
//                        // Удаляем старые вопросы и ответы для этого квиза
//                        try AnswerTable.all
//                            .where { answer in
//                                QuestionTable.all
//                                    .where { $0.quizRowID == quiz.id }
//                                    .select(\.id)
//                                    .contains(answer.questionID)
//                            }
//                            .deleteAll(db)
//                        
//                        try QuestionTable.all
//                            .where { $0.quizRowID == quiz.id }
//                            .deleteAll(db)
//                    } else {
//                        // Создаём новый квиз
//                        try QuizTable.insert(quizTable).execute(db)
//                    }
//                    
//                    // Добавляем вопросы и ответы
//                    for question in quiz.questions {
//                        let questionTable = QuestionTable(
//                            id: question.id,
//                            title: question.title,
//                            descriptionText: question.descriptionText,
//                            descriptionLink: question.descriptionLink,
//                            hasUserAnswered: question.hasUserAnswered,
//                            isUserAnswerCorrect: question.isUserAnswerCorrect,
//                            quizRowID: quiz.id
//                        )
//                        try QuestionTable.insert(questionTable).execute(db)
//                        
//                        for answer in question.answers {
//                            let answerTable = AnswerTable(
//                                id: answer.id,
//                                title: answer.title,
//                                isCorrect: answer.isCorrect,
//                                questionID: question.id
//                            )
//                            try AnswerTable.insert(answerTable).execute(db)
//                        }
//                    }
//                }
//            }
        },
        deleteSource: { source in
            @Dependency(\.defaultDatabase) var database
            
//            try await database.write { db in
//                // Получаем все связанные ID для оптимизации удаления
//                let quizIds = try QuizTable.all
//                    .where { $0.sourceRowID == source.id }
//                    .select(\.id)
//                    .fetchAll(db)
//                
//                guard !quizIds.isEmpty else {
//                    // Если нет квизов, просто удаляем источник
//                    try SourceTable.all
//                        .where { $0.id == source.id }
//                        .deleteAll(db)
//                    return
//                }
//                
//                let questionIds = try QuestionTable.all
//                    .where { quizIds.contains($0.quizRowID) }
//                    .select(\.id)
//                    .fetchAll(db)
//                
//                // Удаляем в правильном порядке (от листьев к корню)
//                if !questionIds.isEmpty {
//                    // Удаляем ответы
//                    try AnswerTable.all
//                        .where { questionIds.contains($0.questionID) }
//                        .deleteAll(db)
//                    
//                    // Удаляем вопросы
//                    try QuestionTable.all
//                        .where { questionIds.contains($0.id) }
//                        .deleteAll(db)
//                }
//                
//                // Удаляем квизы
//                try QuizTable.all
//                    .where { quizIds.contains($0.id) }
//                    .deleteAll(db)
//                
//                // Удаляем источник
//                try SourceTable.all
//                    .where { $0.id == source.id }
//                    .deleteAll(db)
//            }
        }
    )
}

// MARK: - Test/Preview Value
extension StorageService {
    static let testValue: StorageService = .init(
        createSource: { _ in },
        readSources: { [] },
        updateSource: { _ in },
        deleteSource: { _ in }
    )
    
    static let previewValue: StorageService = .init(
        createSource: { _ in },
        readSources: {
            // Можете вернуть здесь тестовые данные для превью
            []
        },
        updateSource: { _ in },
        deleteSource: { _ in }
    )
}

// MARK: - Dependency Values
extension DependencyValues {
    var storageService: StorageService {
        get { self[StorageService.self] }
        set { self[StorageService.self] = newValue }
    }
}

// MARK: - Array asyncMap extension
extension Array {
    func asyncMap<T>(_ transform: @escaping (Element) async throws -> T) async rethrows -> [T] {
        var result: [T] = []
        for element in self {
            let transformed = try await transform(element)
            result.append(transformed)
        }
        return result
    }
}

//try Attendee.all
//   .where { $0.syncUpID.eq(syncUpID) }
//   .fetchAll(db)
//   .map { (attendee: Attendee) in AttendeeDraft(id: uuid(), name: attendee.name) }

//        createSources: { sources in
//            @Dependency(\.defaultDatabase) var db
//            try await db.write { db in
//                for source in sources {
//                    try Source.insert{
//                        source
//                    }
//                    .execute(db)
//                }
//            }
//        },
//        readSources: {
//            @Dependency(\.defaultDatabase) var database
//            let sources = try await database.read { db in
//                try Source.all
//                    .order(by: \.priority)
//                    .fetchAll(db)
//            }
//            print("fetched \(sources.count) sources")
//            return sources
//        }

