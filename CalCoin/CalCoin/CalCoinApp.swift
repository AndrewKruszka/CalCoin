//
//  CalCoinApp.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import SwiftUI


enum ViewType {
    case Start
    case Info
    case MainApp
}

@main
struct CalCoinApp: App {
    @ObservedObject var healthStoreManager = HealthStoreManager()
    @State private var selectedViewType = ViewType.Start

    var body: some Scene {
        WindowGroup {
            containedView()
        }
    }
    
    func containedView() -> AnyView {
        switch(selectedViewType) {
        case .Start:
            return AnyView(DashboardView(healthStoreManager: healthStoreManager));
        case .Info:
            return AnyView(InfoView());
        case .MainApp:
            return AnyView(MainApp());
        default:
            return AnyView(InfoView());
        }
    }
}
