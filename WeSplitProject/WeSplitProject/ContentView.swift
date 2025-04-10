//
//  ContentView.swift
//  WeSplit
//
//  Created by Jayden on 3/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var amountIsFocused: Bool
    
    var useRedText: Bool {
        tipPercentage == 0
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
        
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Total Amount") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                   
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                .foregroundStyle(useRedText ? .red : .blue)
            
                
                Section("How much tip do you want to leave?") {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
            }
            .navigationTitle("WeSplit")
//            .toolbar {
//                if amountIsFocused {
//                    Button("Done") {
//                        amountIsFocused = false
//                    }
//                }
//            }
        }
    }
}

#Preview {
    ContentView()
}
