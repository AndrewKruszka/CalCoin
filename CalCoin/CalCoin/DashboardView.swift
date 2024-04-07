//
//  DashboardView.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @ObservedObject var healthStoreManager: HealthStoreManager
    @State var caloriesBurned: Double = 0
    
    var coinsEarned: Double {
        return floor(caloriesBurned / 100)
    }
    var totalCoinsEarned: Double {
        return floor(caloriesBurned / 100)
    }
    
    var body: some View {
        VStack {
            
            Text("Calories Burned")
                .padding()
            
            CircularProgressView(progress: caloriesBurned / 1500,
                                 color: Color.green,
                                 innerText: "\(caloriesBurned) / 1500");
            
            Text("Coins Earned Today")
                .padding()
            CircularProgressView(progress: coinsEarned / 15,
                                 color: Color.red,
                                 innerText: "\(coinsEarned) / 15");
            
            Text("Coins Earned All Time")
                .padding()
            CircularProgressView(progress: totalCoinsEarned / 75,
                                 color: Color.blue,
                                 innerText: "\(totalCoinsEarned) / 75");
            
            HStack()
            {
                Button("reset") {
                    caloriesBurned = 0;
                }.font(.title).padding()
                
                //            Button("Refresh Data") {
                //                 healthStoreManager.fetchCalorieData()
                //             }
                
                Button("+") {
                    caloriesBurned += 25;
                }.font(.title).padding()
            }
        }
        .onAppear {
            healthStoreManager.fetchCalorieData()
        }
    }
}
