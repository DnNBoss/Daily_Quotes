//
//  APIConfiguration.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 22.09.26.
//

import Foundation

enum APIConfiguration {
    static let randomQuoteURL = URL(string: "https://api.api-ninjas.com/v2/randomquotes")
    
    static var apiKey: String {
        guard
            let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_NINJAS_KEY") as? String,
            !apiKey.isEmpty
        else {
            assertionFailure("Error! API key not found in Info.plist")
            return ""
        }
        return apiKey
    }
}
