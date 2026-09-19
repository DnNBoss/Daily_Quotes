//
//  TimeOfDay.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 17.09.26.
//

import Foundation

enum TimeOfDay {
    case morning, afternoon, evening, night
    
    static var current: TimeOfDay {
        switch Calendar.current.component(.hour, from: Date.now) {
        case 5..<12:
            return .morning
        case 12..<17:
            return .afternoon
        case 17..<23:
            return .evening
        default:
            return .night
        }
    }
    
    var greeting: String {
        switch self {
        case .morning:
            return "Good morning!"
        case .afternoon:
            return "Good afternoon!"
        case .evening:
            return "Good evening!"
        case .night:
            return "Good night!"
        }
    }
    
    var quoteBadge: String {
        switch self {
        case .morning:
            return "Morning quote"
        case .afternoon:
            return "Afternoon quote"
        default:
            return "Evening quote"
        }
    }
    
    var symbol: String {
        switch self {
        case .morning:
            return "sun.horizon"
        case .afternoon:
            return "sun.max"
        case .evening:
            return "cloud.moon"
        case .night:
            return "moon.stars"
        }
    }
}
