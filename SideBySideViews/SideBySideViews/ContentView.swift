//
//  ContentView.swift
//  SnowSeeker
//
//  Created by simge on 2.04.2022.
//

import SwiftUI


//primary one control secondary , secondary controls the tertiary window

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
            
            Text("Tertiary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
