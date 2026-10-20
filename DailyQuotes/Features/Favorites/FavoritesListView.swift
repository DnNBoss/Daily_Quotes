//
//  FavoritesListView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 16.10.26.
//

import SwiftData
import SwiftUI

struct FavoritesListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var quotes: [Quote]
    
    private var favoritesService: FavoritesService {
        FavoritesService(context: modelContext)
    }
    
    var body: some View {
        List {
            ForEach(quotes) { quote in
                NavigationLink {
                    //Details
                } label: {
                    FavoriteRowView(quote: quote)
                }
            }
            .onDelete(perform: removeItems)
        }
        .overlay {
            if quotes.isEmpty {
                ContentUnavailableView(
                    "No favorites yet",
                    systemImage: "heart",
                    description: Text("Add quotes to your favorites list...")
                )
            }
        }
    }
    
    init(sortOrder: SortOrder) {
        _quotes = Query(sort: \.addedAt, order: sortOrder)
    }
    
    private func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            favoritesService.delete(quotes[offset])
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Quote.self, configurations: config)
        
        let context = container.mainContext
        context.insert(Quote.sample)
        context.insert(Quote.sample)
        context.insert(Quote.sample)
        
        return FavoritesListView(sortOrder: .reverse)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
