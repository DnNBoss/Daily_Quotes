//
//  QuoteSlot.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 30.10.26.
//

import Foundation

struct QuoteSlot: Equatable {
    
    let period: TimeOfDay
    let start: Date
    
    private static let periods = TimeOfDay.sortedCases.filter { $0 != .night }
    
    init(at date: Date = .now, calendar: Calendar = .current) {
        let hour = calendar.component(.hour, from: date)
        
        period = Self.periods.last(where: { $0.startHour <= hour }) ?? .evening
        
        let isYesterday = hour < period.startHour
        let day = calendar.date(byAdding: .day, value: isYesterday ? -1 : 0, to: date) ?? date
        
        self.start = calendar.date(bySettingHour: period.startHour, minute: 0, second: 0, of: day) ?? date
    }
    
    static func nextStart(at date: Date = .now, calendar: Calendar = .current) -> Date? {
        periods
            .compactMap {
                calendar.nextDate(
                    after: date,
                    matching: DateComponents(hour: $0.startHour, minute: 0),
                    matchingPolicy: .nextTime
                )
            }
            .min()
    }
}
