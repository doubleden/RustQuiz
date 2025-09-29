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
    var createSources: @Sendable ([Source]) async throws -> Void
    var readSources: @Sendable () async throws -> [Source]
}

extension StorageService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: StorageService = .init(
        createSources: { sources in
            @Dependency(\.defaultDatabase) var db
            try await db.write { db in
                for source in sources {
                    try Source.insert{
                        source
                    }
                    .execute(db)
                }
            }
        },
        readSources: {
            @Dependency(\.defaultDatabase) var database
            let sources = try await database.read { db in
                try Source.all
                    .order(by: \.priority)
                    .fetchAll(db)
            }
            print("fetched \(sources.count) sources")
            return sources
        }
    )
    
    // MARK: - Preview
    static let previewValue: StorageService = .init(
        createSources: { _ in
            
        },
        readSources: {
            [
                Source(id: UUID(), title: "1", priority: 1),
                Source(id: UUID(), title: "2", priority: 2),
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
