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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Quote.self)
        }
    }
}
