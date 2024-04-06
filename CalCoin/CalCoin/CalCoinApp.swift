//
//  CalCoinApp.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import SwiftUI


struct Coin: Decodable {
    var created_at: String
    var id: Int
    var name: String
    var updated_at: String
}

struct CoinsResponse: Decodable {
    var data: [String: [Coin]]
}

@main
struct CalCoinApp: App {
    @ObservedObject var healthStoreManager = HealthStoreManager()

    var body: some Scene {
        WindowGroup {
            requestPermissionsView(healthStoreManager: healthStoreManager)
        }
    }
}
