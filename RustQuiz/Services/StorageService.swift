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
    var createThemes: @Sendable ([Theme]) async throws -> Void
    var readThemes: @Sendable () async throws -> [Theme]
}

extension StorageService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: StorageService = .init(
        createThemes: { themes in
            @Dependency(\.defaultDatabase) var db
            try await db.write { db in
                for theme in themes {
                    try Theme.insert{
                        theme
                    }
                    .execute(db)
                }
            }
        },
        readThemes: {
            @Dependency(\.defaultDatabase) var database
            let themes = try await database.read { db in
                try Theme.all
                    .order(by: \.priority)
                    .fetchAll(db)
            }
            print("fetched \(themes.count) themes")
            return themes
        }
    )
    
    // MARK: - Preview
    static let previewValue: StorageService = .init(
        createThemes: { _ in
            
        },
        readThemes: {
            [
                Theme(id: UUID(), title: "1", priority: 1),
                Theme(id: UUID(), title: "2", priority: 2),
            ]
        }
    )
}

extension DependencyValues {
    var storageService: StorageService {
        get { self[StorageService.self] }
        set { self[StorageService.self] = newValue }
    }
}


//try Attendee.all
//   .where { $0.syncUpID.eq(syncUpID) }
//   .fetchAll(db)
//   .map { (attendee: Attendee) in AttendeeDraft(id: uuid(), name: attendee.name) }
