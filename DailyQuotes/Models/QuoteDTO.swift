//
//  QuoteDTO.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 30.09.26.
//

import Foundation

struct QuoteDTO: Decodable {
    let quote: String
    let author: String
    let work: String?
    let categories: [String]?
}

extension QuoteDTO {
    func toDomain() -> Quote {
        Quote(
            text: quote,
            author: author,
            category: categories?.first ?? "",
            createdAt: .now,
            isFavorite: false
        )
    }
}
