//
//  FavoritesService.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 16.10.26.
//

import Foundation
import SwiftData

struct FavoritesService {
    let context: ModelContext
    
    func toggle(_ quote: Quote) throws {
        if let existing = try fetch(quote) {
            context.delete(existing)
        } else {
            context.insert(quote.makeCopy())
        }
    }
    
    func delete(_ quote: Quote) {
        context.delete(quote)
    }
    
    private func fetch(_ quote: Quote) throws -> Quote? {
        let text = quote.text
        let author = quote.author
        let descriptor = FetchDescriptor<Quote>(
            predicate: #Predicate { $0.text == text && $0.author == author }
        )
        return try context.fetch(descriptor).first
    }
}
