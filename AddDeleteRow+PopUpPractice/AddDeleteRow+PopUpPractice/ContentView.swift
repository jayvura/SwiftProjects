//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Jayden on 4/28/25.
//

import SwiftUI

@Observable
class User {
    var firstName = "Jayden"
    var lastName = "DeCambre"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("\(name)")
            .font(.title)
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                Spacer()
                Spacer()
                Button("Switch to second view") {
                    showingSheet.toggle()
                    
                }
                .sheet(isPresented: $showingSheet) {
                    SecondView(name: "peekaboo")
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
