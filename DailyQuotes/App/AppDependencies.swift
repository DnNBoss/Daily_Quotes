//
//  AppDependencies.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 26.10.26.
//

import SwiftData

@MainActor
final class AppDependencies {
    let modelContainer: ModelContainer
    let favoritesService: FavoritesService
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Quote.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        favoritesService = FavoritesService(context: modelContainer.mainContext)
    }
    
    
}
