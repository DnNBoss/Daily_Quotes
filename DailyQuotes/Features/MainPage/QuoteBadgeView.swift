//
//  QuoteBadgeView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 17.09.26.
//

import SwiftUI

struct QuoteBadgeView: View {
    let timeOfDay: TimeOfDay
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: timeOfDay.symbol)
                .font(.caption)
                
            Text(timeOfDay.quoteBadge)
                .font(.caption2.weight(.semibold))
                .tracking(0.6)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial, in: .capsule)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    QuoteBadgeView(timeOfDay: .current)
}
