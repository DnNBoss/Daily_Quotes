//
//  SettingsView.swift
//  DailyQuotes
//
//  Created by Dmitry Kozlov on 16.11.26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Settings")
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {                Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
