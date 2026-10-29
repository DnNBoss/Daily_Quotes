//
//  ActionsView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct ActionsView: View {
    let quote: Quote?
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: onToggleFavorite) {
                label(
                    "Favorite",
                    systemImage: isFavorite ? "heart.fill" : "heart",
                    tint: isFavorite ? .pink : .primary
                )
            }
            
            Spacer()
            
            Button(action: {}) {
                label(
                    "Translate",
                    systemImage: "translate"
                )
            }
            
            Spacer()
            
            ShareLink(item: quote?.shareText ?? "") {
                label(
                    "Share",
                    systemImage: "square.and.arrow.up"
                )
            }
        }
        .buttonStyle(.plain)
        .disabled(quote == nil)
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity)
    }
    
    private func label(
        _ title: String,
        systemImage: String,
        tint: Color = .primary
    ) -> some View {
        VStack(spacing: 6) {
            Image(systemName: systemImage)
                .font(.title2)
            
            Text(title)
                .font(.caption)
        }
        .foregroundStyle(tint)
    }
}

#Preview {
    ActionsView(quote: .sample, isFavorite: false, onToggleFavorite: { })
}
