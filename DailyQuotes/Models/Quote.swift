//
//  Quote.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import Foundation
import SwiftData

@Model
final class Quote {
    var id: UUID
    var text: String
    var author: String
    var categories: [String]
    var addedAt: Date
    
    init(
        text: String,
        author: String,
        categories: [String] = [],
        addedAt: Date = .now
    ) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.categories = categories
        self.addedAt = addedAt
    }
}

extension Quote {
    static var sample: Quote {
        Quote(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            author: "Unknown",
            categories: ["General", "Wisdom"],
            addedAt: Date()
        )
    }
}
