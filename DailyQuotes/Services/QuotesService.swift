//
//  QuotesService.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 22.09.26.
//

import Foundation

final class QuotesService {
    func fetchQuoteOfTheDay() async throws -> Quote {
        let request = try makeRequest()
        let (data, response) = try await perform(request)
        try validate(response)
        let dto = try decode(data)
        return dto.toDomain()
    }
    
    
    private func makeRequest() throws -> URLRequest {
        guard let url = APIConfiguration.quoteOfTheDayURL else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue(APIConfiguration.apiKey, forHTTPHeaderField: "X-Api-Key")
        
        return request
    }
    
    private func perform(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(for: request)
        } catch {
            throw APIError.network(error)
        }
    }
    
    private func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.server(status: -1)
        }
        
        switch httpResponse.statusCode {
        case 200:
            return
        case 401, 403:
            throw APIError.unauthorized
        case 429:
            throw APIError.rateLimitExceeded
        default:
            throw APIError.server(status: httpResponse.statusCode)
        }
    }
    
    private func decode(_ data: Data) throws -> QuoteDTO {
        do {
            let dtos = try JSONDecoder().decode([QuoteDTO].self, from: data)
            guard let firstQuote = dtos.first else {
                throw APIError.emptyResponse
            }
            return firstQuote
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.decoding(error)
        }
    }
}
