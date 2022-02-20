//
//  ContentView.swift
//  BlendMode
//
//  Created by simge on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack{
            Image("view")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .saturation(amount) //***
                .blur(radius : (1-amount) * 20)
            
            Slider(value:$amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
