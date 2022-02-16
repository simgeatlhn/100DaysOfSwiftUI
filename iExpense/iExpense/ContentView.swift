//
//  ContentView.swift
//  iExpense
//
//  Created by simge on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false //**
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items , id: \.name){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount , format:.currency(code: "USD"))
                            .foregroundColor( item.amount <= 100 ? .green : item.amount > 100 && item.amount < 500 ? .yellow : .red)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button {
                    //perform
                    showingAddExpense = true
                } label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
