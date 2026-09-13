//
//  MainPageView.swift
//  DailyQuotes
//
//  Created by Дмитрий Козлов on 13.09.26.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            
            Spacer()
            
            QuoteCardView()
            
            Spacer()
            
            ActionsView()
//                .padding(.bottom, 200)
            Spacer()
        }
    }
}

#Preview {
    MainPageView()
}
