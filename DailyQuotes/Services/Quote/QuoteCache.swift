//
//  QuoteCache.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 6.11.26.
//

import Foundation

struct QuoteCache {
    private struct Entry: Codable {
        let text: String
        let author: String
        let categories: [String]
        let slotStart: Date
    }
    
    private let defaults: UserDefaults
    private let key = "currentQuoteSlot"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func load(for slot: QuoteSlot) -> Quote? {
        guard
            let data = defaults.data(forKey: key),
            let entry = try? JSONDecoder().decode(Entry.self, from: data),
            entry.slotStart == slot.start
        else { return nil }
        
        return Quote(text: entry.text, author: entry.author, categories: entry.categories)
    }
    
    func save(_ quote: Quote, for slot: QuoteSlot) {
        let entry = Entry(
            text: quote.text,
            author: quote.author,
            categories: quote.categories,
            slotStart: slot.start
        )
        
        if let data = try? JSONEncoder().encode(entry) {
            defaults.set(data, forKey: key)
        }
    }
}
