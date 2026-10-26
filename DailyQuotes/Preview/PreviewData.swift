//
//  PreviewData.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 26.10.26.
//

import SwiftData

@MainActor
enum PreviewData {
    static let container: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Quote.self, configurations: config)
        
        let samples: [(String, String, [String])] = [
            ("Stay hungry, stay foolish.", "Steve Jobs", ["success"]),
            ("To be, or not to be, that is the question.", "William Shakespeare", ["life, philosophy"]),
            ("Life is what happens while you are busy making other plans.", "John Lennon", ["life"]),
            ("Know thyself.", "Aristotle", ["wisdom"])
        ]
        
        for (text, author, categories) in samples {
            container.mainContext.insert(
                Quote(text: text, author: author, categories: categories)
            )
        }
        return container
    }()
    
    static var favoritesService: FavoritesService {
        FavoritesService(context: container.mainContext)
    }
}
