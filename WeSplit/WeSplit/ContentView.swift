//
//  ContentView.swift
//  WeSplit
//
//  Created by Anisha Lamichhane on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "" //SwiftUI must use strings to store text field values.
    @State private var numOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [ 5 , 10 , 15 , 20, 25, 0]
    var totalPerPerson: Double {
//        calculate the total per person here
        let peopleCount = Double(numOfPeople) ?? 0   //challenge 3
       
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = tipSelection/100 * orderAmount
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
//            entering the amount section
            Form {
                Section {
                    TextField("Amount:", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("No of People:", selection: $numOfPeople) {
//                        ForEach( 2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    
//                    challenge 3
                    TextField("Number of people:", text: $numOfPeople)
                        .keyboardType(.decimalPad)
                }
             
                
//                tip section
                Section (header: Text("How much tip do you want to leave")){// writing an header to the section
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach( 0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
//                challenge 2
                Section {
                    let orderAmount = Double(checkAmount) ?? 0
                    let tipSelection = Double(tipPercentages[tipPercentage])
                    let tipValue = tipSelection/100 * orderAmount
                    Text("Check Amount: $\(orderAmount, specifier: "%.2f")")
                    Text("Tip Amount: $\(tipValue, specifier: "%.2f")")
                }
                
//                final result segment
//                challenge 1
                Section( header: Text("amount per person :")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
