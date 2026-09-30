//
//  APIError.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 22.09.26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case unauthorized
    case rateLimitExceeded
    case server(status: Int)
    case emptyResponse
    case decoding(Error)
    case network(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Failed to form the URL"
        case .unauthorized:
            return "Invalid API key"
        case .rateLimitExceeded:
            return "Rate limit exceeded. Please try again later"
        case .server(status: let status):
            return "The server returned an error: \(status)"
        case .emptyResponse:
            return "Empty response from the server"
        case .decoding(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .network(let error):
            return "The internet connection appears to be offline. Please check your connection and try again later. Network error: \(error.localizedDescription)."
        }
    }
}
