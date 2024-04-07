//
//  CalCoinApp.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import SwiftUI


@main
struct CalCoinApp: App {
    @ObservedObject var healthStoreManager = HealthStoreManager()

    var body: some Scene {
        WindowGroup {
            requestPermissionsView(healthStoreManager: healthStoreManager)
        }
    }
}
