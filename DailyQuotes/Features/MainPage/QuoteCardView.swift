//
//  QuoteCardView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct QuoteCardView: View {
    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(quote.text)
                .font(.system(.title2, design: .serif, weight: .medium))
                .fontWeight(.medium)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(quote.author)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    QuoteCardView(quote: .sample)
}
