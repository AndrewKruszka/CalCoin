//
//  CircularProgressView.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/6/24.
//

import Foundation
import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let color: Color
    let innerText: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)
            Text(innerText)
        }
    }
}
