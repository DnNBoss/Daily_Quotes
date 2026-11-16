//
//  HeaderView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct HeaderView: View {
    let timeOfDay: TimeOfDay
    @Binding var showingSettings: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(timeOfDay.greeting)
                    .font(.headline)
                
                Text(Date.now, format: .dateTime.day().month(.wide))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                showingSettings = true
            } label: {
                Image(systemName: "gearshape")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    HeaderView(timeOfDay: .current, showingSettings: .constant(false))
}
