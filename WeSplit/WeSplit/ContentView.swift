//
//  ContentView.swift
//  WeSplit
//
//  Created by simge on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var amountPerPerson = 0
    
    //For keyboard
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [ 10 , 15 , 20 , 25 , 0]
    
    
    var totalPerson : Double {
        let peopleCount = Double (numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal : Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount",value:$checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "USD")
                    )
                        .keyboardType( .decimalPad)
                        .focused($amountIsFocused)
                    
                    
                    //Option 1
                    TextField("Number of people", value: $numberOfPeople, format:.number)
                        .keyboardType(.decimalPad)
                    
                    //Option 2
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0 ..< 101) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip Percantage",selection: $tipPercentage){
                        //id = key //for döngüsüne tüm tipPercantages girecek şart yok
                        ForEach(tipPercentages , id: \.self){
                            Text($0 , format:.percent)
                        }
                    }
                    .pickerStyle(.segmented) //segmented is nice picker style
                }header:{
                    Text("How much to do you want to leave ?") //Picker title
                }
                
                
                Section{
                    Text(totalPerson,format: .currency(code:Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Amount Per Person")
                }
                
                //Final section , we should use totalPerson
                Section{
                    Text(grandTotal , format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    
                }header:{
                    Text("Total Amount")
                }
                
            }
            .navigationTitle("WeSplit")
            //new modifier called toolbar
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
