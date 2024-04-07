//
//  Header.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/7/24.
//

import SwiftUI

struct Header: View {
    @State private var selectedViewType = ViewType.Start

    
    var body: some View {
        ZStack()
        {
            Rectangle()
            HStack()
            {
                Image("AppIcon")
                Text("Welcome back, Gavin")
                Image("AppIcon")
            }
        }
    }
}

