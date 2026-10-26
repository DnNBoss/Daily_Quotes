//
//  QuoteDetailView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 24.10.26.
//

import SwiftUI

struct QuoteDetailView: View {
    @Environment(FavoritesService.self) private var favoritesService
    @Environment(\.dismiss) private var dismiss
    
    @State private var showingDeleteConfirm = false
    
    let quote: Quote
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("«\(quote.text)»")
                        .font(.system(.title2, design: .serif, weight: .medium))
                    
                    Text("- \(quote.author)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }
            
            Section("Details") {
                LabeledContent("Date added:") {
                    Text(quote.addedAt, format: .dateTime.day().month(.wide).year())
                }
                
                LabeledContent("Time:") {
                    Text(quote.addedAt, format: .dateTime.hour().minute())
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if quote.categories.isEmpty {
                        LabeledContent("Categories:", value: "None")
                    } else {
                        Text("Categories:")
                        Text(quote.categories.map(\.capitalized).formatted())
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Section("Actions") {
                ShareLink(item: "«\(quote.text)» - \(quote.author)")
                
                Button(role: .destructive) {
                    showingDeleteConfirm = true
                } label: {
                    Label("Remove from favorites", systemImage: "heart.slash")
                }
                .foregroundStyle(.red)
            }
        }
        .confirmationDialog(
            "Remove from favorites?",
            isPresented: $showingDeleteConfirm,
            titleVisibility: .visible
        ) {
            Button("Remove", role: .destructive) {
                dismiss()
                favoritesService.delete(quote)
            }
        }
        .navigationTitle("Quote")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    QuoteDetailView(quote: .sample)
        .environment(PreviewData.favoritesService)
}
