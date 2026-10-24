//
//  FavoritesListView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 16.10.26.
//

import SwiftData
import SwiftUI

struct FavoritesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var quotes: [Quote]
    
    private let searchText: String
    
    private var favoritesService: FavoritesService {
        FavoritesService(context: modelContext)
    }
    
    var body: some View {
        List {
            ForEach(quotes) { quote in
                NavigationLink {
                    QuoteDetailView(quote: quote)
                } label: {
                    FavoriteRowView(quote: quote)
                }
            }
            .onDelete(perform: removeItems)
        }
        .overlay {
            if quotes.isEmpty {
                if searchText.isEmpty {
                    ContentUnavailableView(
                        "No favorites yet",
                        systemImage: "heart",
                        description: Text("Add quotes to your favorites list...")
                    )
                } else {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
    
    init(searchText: String, sort: [SortDescriptor<Quote>]) {
        self.searchText = searchText
        
        let predicate: Predicate<Quote>? = searchText.isEmpty
        ? nil
        : #Predicate<Quote> { quote in
            quote.text.localizedStandardContains(searchText)
            || quote.author.localizedStandardContains(searchText)
        }
        _quotes = Query(filter: predicate, sort: sort)
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
        
        return FavoritesListView(
            searchText: "",
            sort: [SortDescriptor(\.addedAt, order: .forward)]
        )
        .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
