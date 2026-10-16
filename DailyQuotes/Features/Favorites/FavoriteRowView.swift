//
//  FavoriteRowView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 14.10.26.
//

import SwiftUI

struct FavoriteRowView: View {
    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("«\(quote.text)»")
                .font(.system(.body, design: .serif, weight: .medium))
            
            Text("- \(quote.author)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if !quote.categories.isEmpty {
                HStack {
                    ForEach(quote.categories.prefix(4), id: \.self) { category in
                        Text(category.capitalized)
                            .font(.caption)
                            .padding(8)
                            .background(.quinary, in: .capsule)
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteRowView(quote: .sample)
}
