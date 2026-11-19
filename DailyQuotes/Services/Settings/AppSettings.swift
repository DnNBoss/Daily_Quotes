//
//  AppSettings.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 17.11.26.
//

import Foundation

@Observable
final class AppSettings {
    var theme: AppTheme {
        didSet {
            defaults.set(theme.rawValue, forKey: Keys.theme)
        }
    }
    
    private let defaults: UserDefaults
    
    private enum Keys {
        static let theme = "settingsTheme"
    }
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        self.theme = defaults.string(forKey: Keys.theme).flatMap(AppTheme.init) ?? .light
    }
}
