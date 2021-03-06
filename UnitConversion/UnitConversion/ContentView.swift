//
//  ContentView.swift
//  Unit Conversion
//
//  Created by simge on 3.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    let timeTypes = ["secs","mins","days","weeks"]
     
     @State var fromTimeType = 0
     @State var toTimeType = 0
     @State var updateValue = ""
     
     var resultValue : Double {
         var userInput = 0.0
         var result = 0.0

         if let updateValue = Double(updateValue) {
             
             
             switch fromTimeType {
             case 0:
                 userInput = updateValue
             case 1:
                 userInput = updateValue / 60
             case 2:
                 userInput = updateValue / 86400
             case 3:
                 userInput = updateValue / 604800
             default:
                 userInput = 1
             }
         }
         
         
             switch toTimeType {
             case 1:
                 userInput = userInput * 60
             case 2:
                 userInput = userInput * 86400
             case 3:
                 userInput = userInput * 604800
             default:
                 result = 1
             }
             
         return Double(userInput)
      }
    
    var body : some View {
        
        NavigationView{
            Form {
                
                //Section 1
                Section(){
                    TextField("Value" , text:$updateValue)
                        .keyboardType(.decimalPad)
                }header:{
                    Text("Enter a value")
                }
                
                
                //Section 2
                Section{
                    Picker("",selection: $toTimeType){
                        ForEach(0 ..< timeTypes.count){ item in
                            Text("\(timeTypes[item])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }header:{
                    Text("What time type do you want to convert?")
                }
                
                
                //Section 3
                Section {
                    Picker("",selection:$fromTimeType){
                        ForEach(0..<timeTypes.count){item in
                            Text("\(timeTypes[item])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }header:{
                    Text("Which time type do you want to convert?")
                }
                
                
                // Section 4
                Section(){
                    Text("Result \(resultValue,specifier: "%0.2f")")
                }header:{
                    Text("Result:")
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

