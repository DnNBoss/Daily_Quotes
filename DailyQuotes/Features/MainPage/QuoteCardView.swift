//
//  QuoteCardView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct QuoteCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(Quote.sample.text)
                .font(.title2)
                .fontWeight(.medium)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(Quote.sample.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.thinMaterial)
        )
        .padding(.horizontal, 24)
    }
}

#Preview {
    QuoteCardView()
}
