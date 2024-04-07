//
//  InfoView.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/6/24.
//

import SwiftUI

struct InfoView: View {
    @Binding var selectedViewType: ViewType
    @State var infoStage: Int = 1
    
    var body: some View {
        containedView();
    }
    
    func containedView() -> AnyView {
        switch(infoStage) {
            case 1:
                return AnyView(InfoView1(infoStage: $infoStage));
            case 2:
                return AnyView(InfoView1(infoStage: $infoStage));
            case 3:
                return AnyView(InfoView1(infoStage: $infoStage));   
            default:
                return AnyView(InfoView1(infoStage: $infoStage));
        }
    }
}

struct InfoView1: View {
    @Binding var infoStage: Int
    
    @State var name: String = ""
    
    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            HStack()
            {
                Text("Hi")
                TextField(
                    "First Name",
                    text: $name
                )
            }
            Text("What is your top priority right now?")

            Button() {
                infoStage = 2
            }
            label: {
                Rectangle()
                Text("Lose Weight")
            }
            
            Button() {
                infoStage = 2
            }
            label: {
                Rectangle()
                Text("Gain Mass")
            }
            
            Button() {
                infoStage = 2
            }
            label: {
                Rectangle()
                Text("Improve Healthy Habits")
            }
            
            Button() {
                infoStage = 2
            }
            label: {
                Rectangle()
                Text("Earn Rewards")
            }
        }
    }
}


struct InfoView2: View {
    @Binding var selectedViewType: ViewType
    @Binding var infoStage: Int
    
    @State var name: String
    
    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("Which would you pick?")
            Image("CalcoinPrimary")
            Image("CalcoinPrimary")
        }
    }
}

class Goal : Identifiable
{
    var image: String
    var favorited: Bool
    var coinsRequired: Int = 0
    var id = UUID()

    init()
    {
        image = ""
        favorited = false
    }
}

struct InfoView3: View {
    @Binding var selectedViewType: ViewType
    @Binding var infoStage: Int
    
    @State var name: String
    @State var goals: [Goal] = []

    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("Let's set goals to earn it!")
            HStack()
            {
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("Rewards")
                }
                
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("BioMetrics")
                }
            }
            ForEach(Array(goals.enumerated()), id: \.offset) { index, goal in
                HStack()
                {
                    Image("CalcoinPrimary")
                    VStack()
                    {
                        Text("Goal \(index)")
                        Text("\(goal.coinsRequired)")
                        Text("calcoins")
                    }
                }
            }
            Button() {
             
            }
            label: {
                Text("+")
            }
            
            Button() {
                infoStage = 3
            }
            label: {
                Rectangle()
                Text("Next")
            }
        }
    }
}

struct InfoView4: View {
    @Binding var selectedViewType: ViewType
    @Binding var infoStage: Int
    
    @State var age: String = ""
    @State var height: String = ""
    @State var currentWeight: Double = 0.0
    @State var goalWeight: Double = 0.0
    @State private var date = Date()

    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("What are your current stats?")
            HStack()
            {
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("Rewards")
                }
                
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("BioMetrics")
                }
            }
            
            HStack()
            {
                TextField(
                    "6'0",
                    text: $age
                )
                TextField(
                    "37",
                    text: $height
                )
            }
            
            Slider(
                value: $currentWeight,
                in: 0...500
            )
            Text("\(currentWeight)")
            Text("Current Weight")

            
            Slider(
                value: $goalWeight,
                in: 0...500
            )
            Text("\(goalWeight)")
            Text("Goal Weight")
            
            DatePicker(
                "By When?",
                selection: $date,
                displayedComponents: [.date]
            )
            
            Button() {
                infoStage = 4
            }
            label: {
                Rectangle()
                Text("Calculate")
            }
        }
    }
}

struct InfoView5: View {
    @Binding var selectedViewType: ViewType
    @Binding var infoStage: Int
    
    @State var name: String
    @State var goals: [Goal] = []

    var body: some View {
        VStack()
        {
            Image("CalcoinPrimary")
            Text("Let's set goals to earn it!")
            HStack()
            {
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("Rewards")
                }
                
                Button() {
                 
                }
                label: {
                    Rectangle()
                    Text("Rewards")
                }
            }
            ForEach(Array(goals.enumerated()), id: \.offset) { index, goal in
                HStack()
                {
                    Image("CalcoinPrimary")
                    VStack()
                    {
                        Text("Goal \(index)")
                        Text("\(goal.coinsRequired)")
                        Text("calcoins")
                    }
                }
            }
            Button() {
             
            }
            label: {
                Text("+")
            }
            
            Button() {
                infoStage = 5
            }
            label: {
                Rectangle()
                Text("Next")
            }
        }
    }
}


