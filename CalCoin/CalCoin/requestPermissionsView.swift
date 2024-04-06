import SwiftUI

struct requestPermissionsView: View {
    @ObservedObject var healthStoreManager: HealthStoreManager
    @State private var showCalorieView = false

    var body: some View {
        if(showCalorieView)
        {
            DashboardView(healthStoreManager: healthStoreManager)

        }
        else
        {
            Text("We need access to your HealthKit data to proceed.")
            Button("Grant Access") {
                healthStoreManager.requestHealthKitPermission { success in
                    if success {
                        DispatchQueue.main.async {
                            showCalorieView = true
                        }
                    }
                }
            }
        }
    }
}
