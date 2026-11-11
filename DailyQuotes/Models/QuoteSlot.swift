//
//  QuoteSlot.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 30.10.26.
//

import Foundation

struct QuoteSlot: Hashable {
    
    let period: TimeOfDay
    let start: Date
    
    private static let periods = TimeOfDay.sortedCases.filter { $0 != .night }
    private static let lastPeriod = periods.last ?? .evening
    
    init(at date: Date = .now, calendar: Calendar = .current) {
        let hour = calendar.component(.hour, from: date)
        
        let period = Self.periods.last(where: { $0.startHour <= hour }) ?? Self.lastPeriod
        
        let isYesterday = hour < period.startHour
        let day = calendar.date(byAdding: .day, value: isYesterday ? -1 : 0, to: date) ?? date
        
        self.period = period
        self.start = calendar.date(bySettingHour: period.startHour, minute: 0, second: 0, of: day) ?? date
    }
    
    static func nextStart(after date: Date = .now, calendar: Calendar = .current) -> Date? {
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
