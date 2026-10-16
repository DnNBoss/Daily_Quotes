//
//  FavoritesView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 14.10.26.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            FavoritesListView(sortOrder: .reverse)
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
