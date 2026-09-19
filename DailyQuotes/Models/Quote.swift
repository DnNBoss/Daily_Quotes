//
//  Quote.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import Foundation

final class Quote {
    let id: UUID
    let text: String
    let author: String
    let category: String
    let createdAt: Date
    let isFavorite: Bool
    
    init(
        text: String,
        author: String,
        category: String,
        createdAt: Date,
        isFavorite: Bool
    ) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.category = category
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
}

extension Quote {
    static var sample: Quote {
        Quote(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            author: "Unknown",
            category: "General",
            createdAt: Date(),
            isFavorite: false
        )
    }
}
