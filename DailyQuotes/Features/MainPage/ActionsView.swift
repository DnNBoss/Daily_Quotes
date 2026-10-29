//
//  ActionsView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct ActionsView: View {
    let isFavorite: Bool
    let isDisabled: Bool
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            actionButton(
                icon: isFavorite ? "heart.fill" : "heart",
                title: "Favorite",
                tint: isFavorite ? .pink : .primary,
                action: onToggleFavorite
            )
            .disabled(isDisabled)
            
            Spacer()
            actionButton(icon: "translate", title: "Translate") { }
            Spacer()
            actionButton(icon: "square.and.arrow.up", title: "Share") { }
        }
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func actionButton(
        icon: String,
        title: String,
        tint: Color = .primary,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.title2)
                
                Text(title)
                    .font(.caption)
            }
            .foregroundStyle(tint)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ActionsView(isFavorite: false, isDisabled: false, onToggleFavorite: { })
}
