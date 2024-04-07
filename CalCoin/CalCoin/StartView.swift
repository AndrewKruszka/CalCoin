import SwiftUI


struct StartView: View {
    @ObservedObject var healthStoreManager: HealthStoreManager
    @Binding var selectedViewType: ViewType

    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("Ready to Burn and Earn ?")
            Button() {
                healthStoreManager.requestHealthKitPermission { success in
                    if success {
                        DispatchQueue.main.async {
                            selectedViewType = ViewType.Info
                        }
                    }
                }
            }
            label: {
                Rectangle()
                Text("Let's Get Started")
            }
        }
        
    }
}


