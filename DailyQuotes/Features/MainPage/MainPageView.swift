//
//  MainPageView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct MainPageView: View {
    @State private var viewModel = ViewModel()
    
    private let timeOfDay: TimeOfDay = .current
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(timeOfDay: timeOfDay)
                .padding(.top, 8)
            
            QuoteBadgeView(timeOfDay: timeOfDay)
                .padding(.top, 32)
                .padding(.bottom, 20)
            
            quoteScrollArea
                .frame(maxHeight: .infinity)
            
            ActionsView()
                .padding(.top, 16)
            
            nextQuoteLabel
                .padding(.vertical, 32)
        }
        .padding(.horizontal, 20)
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
}

#Preview {
    MainPageView()
}
