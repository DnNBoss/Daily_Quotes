//
//  HeaderView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct HeaderView: View {
    let timeOfDay: TimeOfDay
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(timeOfDay.greeting)
                .font(.headline)
            
            Text(Date.now, format: .dateTime.day().month(.wide))
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderView(timeOfDay: .current)
}
