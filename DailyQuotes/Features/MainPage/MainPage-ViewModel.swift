//
//  MainPage-ViewModel.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 30.09.26.
//

import Foundation

extension MainPageView {
    
    @Observable
    final class ViewModel {
        enum State {
            case idle
            case loading
            case loaded(Quote)
            case failed(APIError)
        }
        
        private(set) var state: State = .idle
        private let service: QuotesService
        
        var currentQuote: Quote? {
            if case .loaded(let quote) = state { quote } else { nil }
        }
        
        init(service: QuotesService = QuotesService()) {
            self.service = service
        }
        
        func load() async {
            state = .loading
            
            do {
                let quote = try await service.fetchQuoteOfTheDay()
                state = .loaded(quote)
            } catch let error as APIError {
                state = .failed(error)
            } catch {
                state = .failed(.network(error))
            }
        }
        
        func loadIfNeeded() async {
            if case .loaded = state { return }
            await load()
        }
    }
}
