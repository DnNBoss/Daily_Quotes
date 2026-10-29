//
//  DailyQuotesApp.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftData
import SwiftUI

@main
struct DailyQuotesApp: App {
    @State private var dependencies = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dependencies.favoritesService)
        }
        .modelContainer(dependencies.modelContainer)
    }
}
