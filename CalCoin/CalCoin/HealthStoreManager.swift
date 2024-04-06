//
//  HealthStoreView.swift
//  CalCoin
//
//  Created by Andrew Kruszka on 4/6/24.
//

import Foundation
import HealthKit
import SwiftUI

class HealthStoreManager: ObservableObject {
    @Published var calorieData: Int = 0
    private var healthStore: HKHealthStore?

    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
            print("HealthKit is available")
        } else {
            print("HealthKit is not available on this device")
        }
    }

    func requestHealthKitPermission(completion: @escaping (Bool) -> Void) {
        guard let healthStore = healthStore else {
            print("Health store not initialized")
            completion(false)
            return
        }

        let typesToRead: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!]

        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if let error = error {
                print("Error requesting HealthKit authorization: \(error)")
            }
            print("HealthKit authorization requested, success: \(success)")
            completion(success)
        }
    }

    func fetchCalorieData() {
        guard let healthStore = healthStore,
              let energyBurnedType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else { return }

        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: energyBurnedType, quantitySamplePredicate: predicate, options: .cumulativeSum) { [weak self] _, statistics, _ in
            DispatchQueue.main.async {
                if let quantity = statistics?.sumQuantity() {
                    let calories = quantity.doubleValue(for: HKUnit.kilocalorie())
                    self?.calorieData = Int(calories)
                    print("Calories fetched: \(calories)")
                }
            }
        }

        healthStore.execute(query)
    }
}
