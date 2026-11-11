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
        private var loadedSlot: QuoteSlot?
        private let service: QuotesService
        
        var greetingTime: TimeOfDay { .current }
        
        var badgeTime: TimeOfDay { (loadedSlot ?? QuoteSlot()).period }
        
        var nextQuoteAt: Date? { QuoteSlot.nextStart() }
        
        var currentQuote: Quote? {
            if case .loaded(let quote) = state { quote } else { nil }
        }
        
        init(service: QuotesService = QuotesService()) {
            self.service = service
        }
        
        func loadIfNeeded() async {
            switch state {
            case .loading: return
            case .loaded where loadedSlot == QuoteSlot(): return
            default: await load()
            }
        }
        
        func load() async {
            let slot = QuoteSlot()
            state = .loading
            
            do {
                let quote = try await service.getQuote(for: slot)
                loadedSlot = slot
                state = .loaded(quote)
            } catch is CancellationError {
                state = .idle
            } catch let error as APIError {
                state = .failed(error)
            } catch {
                state = .failed(.network(error))
            }
        }
    }
}
