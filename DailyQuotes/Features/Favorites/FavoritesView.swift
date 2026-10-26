//
//  FavoritesView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 14.10.26.
//

import SwiftData
import SwiftUI

struct FavoritesView: View {
    @AppStorage("favorites.sort") private var sort: FavoritesSort = .dateAdded
    @AppStorage("favorites.ascending") private var ascending = false
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            FavoritesListView(
                searchText: searchText,
                sort: sort.descriptors(ascending: ascending)
            )
            .navigationTitle("Favorites")
            .searchable(text: $searchText, prompt: "Search quotes")
            .toolbar {
                ToolbarItem {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort by", selection: $sort) {
                            ForEach(FavoritesSort.allCases) { item in
                                Text(item.title).tag(item)
                            }
                        }
                        
                        Picker("Order", selection: $ascending) {
                            Text(sort.orderTitle(ascending: true)).tag(true)
                            Text(sort.orderTitle(ascending: false)).tag(false)
                        }
                    }
                }
            }
            .onChange(of: sort) { _, newValue in
                ascending = newValue.defaultAscending
            }
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(PreviewData.container)
        .environment(PreviewData.favoritesService)
}
