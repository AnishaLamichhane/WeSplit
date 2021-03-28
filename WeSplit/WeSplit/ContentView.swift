//
//  ContentView.swift
//  WeSplit
//
//  Created by Anisha Lamichhane on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "" //SwiftUI must use strings to store text field values.
    @State private var numOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [ 5 , 10 , 15 , 20, 25, 0]
    var totalPerPerson: Double {
//        calculate the total per person here
        let peopleCount = Double(numOfPeople + 2)
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
                    
                    Picker("No of People:", selection: $numOfPeople) {
                        ForEach( 2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
//                tip section
                Section (header: Text("How much tip do you want to leave")){
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach( 0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
//                final result segment
                Section {
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
