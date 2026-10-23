//
//  FavoritesSort.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 22.10.26.
//

import Foundation

enum FavoritesSort: String, CaseIterable, Identifiable {
    case dateAdded
    case author
    case text
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .dateAdded: "Date added"
        case .author: "Author"
        case .text: "Text"
        }
    }
    
    var defaultAscending: Bool {
        self != .dateAdded
    }
    
    func orderTitle(ascending: Bool) -> String {
        switch(self, ascending) {
        case (.dateAdded, true): "Oldest first"
        case (.dateAdded, false): "Newest first"
        case (_, true): "Ascending (A-Z)"
        case (_, false): "Descending (Z-A)"
        }
    }
    
    func descriptors(ascending: Bool) -> [SortDescriptor<Quote>] {
        let order: SortOrder = ascending ? .forward : .reverse
        
        switch self {
        case .dateAdded:
            return [SortDescriptor(\.addedAt, order: order)]
        case .author:
            return [SortDescriptor(\.author, order: order),
                    SortDescriptor(\.addedAt, order: .reverse)]
        case .text:
            return [SortDescriptor(\.text, order: order),
                    SortDescriptor(\.addedAt, order: .reverse)]
        }
    }
}
