//
//  HeaderView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct HeaderView: View {
    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date.now)
       
        switch hour {
        case 5..<12:
            return "Good morning!"
        case 12..<17:
            return "Good afternoon!"
        case 17..<23:
            return "Good evening!"
        default:
            return "Good night!"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(greeting)
                .font(.headline)
            
            Text(Date.now, format: .dateTime.day().month(.wide))
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

#Preview {
    HeaderView()
}
