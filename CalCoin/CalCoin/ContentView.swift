//
//  ContentView.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var healthStoreManager = HealthStoreManage()
    @State private var coins: [Coin] = []

    var body: some View {
        Text("Calories burned: \(healthStoreManager.calorieData)")
            .onAppear {
                healthStoreManager.requestHealthKitPermission { success in
                    if success {
                        healthStoreManager.fetchCalorieData()
                    }
                }
            }
        List(coins, id: \.id) { coin in
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text("Created at: \(coin.created_at)")
                    .font(.subheadline)
                Text("Updated at: \(coin.updated_at)")
                    .font(.subheadline)
            }
        }
        .onAppear {
            postRequest { result in
                switch result {
                case .success(let coinsData):
                    DispatchQueue.main.async {
                        self.coins = coinsData
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
