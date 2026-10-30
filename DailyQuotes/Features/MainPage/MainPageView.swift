//
//  MainPageView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftData
import SwiftUI
import Translation

struct MainPageView: View {
    @Environment(FavoritesService.self) private var favoritesService
    @Query private var quotes: [Quote]
    
    @State private var viewModel = ViewModel()
    @State private var showingTranslation = false
    @State private var showingErrorAlert = false
    @State private var errorMessage = ""
    
    private let timeOfDay: TimeOfDay = .current
    
    private var isFavorite: Bool {
        guard let quote = viewModel.currentQuote else { return false }
        return quotes.contains { $0.text == quote.text && $0.author == quote.author }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(timeOfDay: timeOfDay)
                .padding(.top, 8)
            
            QuoteBadgeView(timeOfDay: timeOfDay)
                .padding(.top, 32)
                .padding(.bottom, 20)
            
            quoteScrollArea
                .frame(maxHeight: .infinity)
            
            ActionsView(
                quote: viewModel.currentQuote,
                isFavorite: isFavorite,
                onToggleFavorite: toggleFavorite,
                onTranslate: { showingTranslation = true }
            )
            .padding(.top, 16)
            .translationPresentation(isPresented: $showingTranslation, text: viewModel.currentQuote?.text ?? "")
            
            nextQuoteLabel
                .padding(.vertical, 32)
        }
        .padding(.horizontal, 20)
        .alert("Error!", isPresented: $showingErrorAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
        .task {
            await viewModel.loadIfNeeded()
        }
    }
    
    private var nextQuoteLabel: some View {
        Text("Next quote in 7h 30m")
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity)
    }
    
    private var quoteScrollArea: some View {
        GeometryReader { proxy in
            ScrollView {
                quoteContent
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height)
            }
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize)
        }
    }
    
    @ViewBuilder
    private var quoteContent: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView()
            
        case .loaded(let quote):
            QuoteCardView(quote: quote)
            
        case .failed(let error):
            VStack(spacing: 12) {
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Button("Reload") {
                    Task {
                        await viewModel.load()
                    }
                }
            }
        }
    }
    
    private func toggleFavorite() {
        guard let quote = viewModel.currentQuote else { return }
        do {
            try favoritesService.toggle(quote)
        } catch {
            errorMessage = error.localizedDescription
            showingErrorAlert = true
        }
    }
}

#Preview {
    MainPageView()
        .modelContainer(PreviewData.container)
        .environment(PreviewData.favoritesService)
}
