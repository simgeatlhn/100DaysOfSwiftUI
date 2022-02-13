//
//  ContentView.swift
//  Calculator
//
//  Created by simge on 13.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftNumber = 1
    @State private var rightNumber = 1
    

    var result : Int {
        let answer = leftNumber * rightNumber
        return answer
    }
    
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section{
                    Stepper("\(leftNumber.formatted())" , value:$leftNumber , in:1...12 , step:1)
                }header:{
                    Text("Select a number")
                }
                
                
                Section{
                    Stepper("\(rightNumber.formatted())" , value:$rightNumber , in:1...12 , step:1)
                }header:{
                    Text("Select another number")
                }
                
                Section{
                    HStack{
                        Text("\(leftNumber) * \(rightNumber) = ")
                        Text (result , format: .number)
                            .foregroundColor(.red)
                    }
                    
                }header:{
                    Text("Result ıs")
                }
                
            }
            .navigationTitle("Calculator 🧮")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
