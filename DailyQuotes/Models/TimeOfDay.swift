//
//  TimeOfDay.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 17.09.26.
//

import Foundation

enum TimeOfDay: CaseIterable {
    case morning, afternoon, evening, night
    
    static var current: TimeOfDay { TimeOfDay(at: .now) }
    static let sortedCases = allCases.sorted { $0.startHour < $1.startHour }

    var startHour: Int {
        switch self {
        case .morning: 5
        case .afternoon: 12
        case .evening: 18
        case .night: 23
        }
    }
    
    
    init(at date: Date, calendar: Calendar = .current) {
        let hour = calendar.component(.hour, from: date)
        
        self = Self.sortedCases.last { $0.startHour <= hour } ?? .night
    }
}

extension TimeOfDay {
    var greeting: String {
        switch self {
        case .morning: "Good morning!"
        case .afternoon: "Good afternoon!"
        case .evening: "Good evening!"
        case .night: "Good night!"
        }
    }
    
    var quoteBadge: String {
        switch self {
        case .morning: "Morning quote"
        case .afternoon: "Afternoon quote"
        case .evening: "Evening quote"
        case .night: "Night quote"
        }
    }
    
    var symbol: String {
        switch self {
        case .morning: "sun.horizon"
        case .afternoon: "sun.max"
        case .evening: "cloud.moon"
        case .night: "moon.stars"
        }
    }
}
