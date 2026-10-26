//
//  FavoritesListView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 16.10.26.
//

import SwiftData
import SwiftUI

struct FavoritesListView: View {
    @Environment(FavoritesService.self) private var favoritesService
    @Query private var quotes: [Quote]
    
    private let searchText: String
    
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
    FavoritesListView(
        searchText: "",
        sort: [SortDescriptor(\.addedAt, order: .forward)]
    )
    .modelContainer(PreviewData.container)
    .environment(PreviewData.favoritesService)
}
