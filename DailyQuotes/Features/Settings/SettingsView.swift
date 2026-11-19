//
//  SettingsView.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 16.11.26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(AppSettings.self) private var settings
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                AppearanceSection()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {                Button("Done") { dismiss() }
                }
            }
        }
        .preferredColorScheme(settings.theme.colorScheme)
    }
}

#Preview {
    SettingsView()
        .environment(PreviewData.settings)
}
