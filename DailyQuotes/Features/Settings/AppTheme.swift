//
//  AppTheme.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 18.11.26.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case light, dark
    
    var id: Self { self }
    
    var title: LocalizedStringResource {
        self == .light ? "Light" : "Dark"
    }
    
    var colorScheme: ColorScheme {
        self == .light ? .light : .dark
    }
}
