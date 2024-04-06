//
//  DashboardView.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @ObservedObject var healthStoreManager: HealthStoreManage

    var body: some View {
        VStack {
            Text("Calories Burned: \(healthStoreManager.calorieData, specifier: "%.0f")")
                .padding()
            Button("Refresh Data") {
                healthStoreManager.fetchCalorieData()
            }
        }
        .onAppear {
            healthStoreManager.fetchCalorieData()
        }
    }
}
