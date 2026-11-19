//
//  AppearanceSection.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 18.11.26.
//

import SwiftUI

struct AppearanceSection: View {
    @Environment(AppSettings.self) private var settings
    
    var body: some View {
        @Bindable var settings = settings
        
        Section("Appearance") {
            Picker("Theme", selection: $settings.theme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.title).tag(theme)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    AppearanceSection()
        .environment(PreviewData.settings)
}
