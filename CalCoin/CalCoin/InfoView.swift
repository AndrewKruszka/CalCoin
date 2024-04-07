//
//  InfoView.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/6/24.
//

import SwiftUI

struct InfoView: View {
    @Binding private var selectedViewType: ViewType
    
    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("Ready to Burn and Earn ?")
            Button() {
                selectedViewType = ViewType.Info
            }
            label: {
                Text("Let's Get Started")
            }
            
            
        }
    }
}

