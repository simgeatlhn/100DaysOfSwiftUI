//
//  ContentView.swift
//  AnimatingGesture
//
//  Created by simge on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAamount = CGSize.zero
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<letters.count){num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAamount)
                    .animation(.default.delay(Double(num) / 20), value: dragAamount) //**
            }
        }
        .gesture(
            DragGesture()
            .onChanged { dragAamount = $0.translation }
            .onEnded{ _ in
                dragAamount = .zero
                enabled.toggle()
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
