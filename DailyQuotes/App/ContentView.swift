//
//  ContentView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppSettings.self) private var settings
    
    var body: some View {
        TabView {
            MainPageView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .preferredColorScheme(settings.theme.colorScheme)
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewData.container)
        .environment(PreviewData.favoritesService)
        .environment(PreviewData.settings)
}
