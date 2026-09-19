//
//  MainPageView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct MainPageView: View {
    private let timeOfDay: TimeOfDay = .current
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(timeOfDay: timeOfDay)
                .padding(.top, 8)
            
            Spacer()
            
            QuoteBadgeView(timeOfDay: timeOfDay)
                .padding(.bottom, 16)
            
            QuoteCardView(quote: .sample)
            
            Spacer()
            
            ActionsView()

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MainPageView()
}
