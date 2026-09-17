//
//  ActionsView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct ActionsView: View {
    var body: some View {
        HStack(spacing: 0) {
            actionButton(icon: "heart", title: "Favorite") { }
            Spacer()
            actionButton(icon: "translate", title: "Translate") { }
            Spacer()
            actionButton(icon: "square.and.arrow.up", title: "Share") { }
        }
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func actionButton(icon: String, title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.title2)
                
                Text(title)
                    .font(.caption)
            }
            .foregroundStyle(.primary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ActionsView()
}
