//
//  ContentView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainPageView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            
            Text("Favorite")
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContentView()
}
