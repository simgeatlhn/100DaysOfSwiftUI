//
//  ContentView.swift
//  TabView
//
//  Created by simge on 15.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = "Favourite"
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("Favourite")
                .onTapGesture {
                    selectedTab = "Person" //*
                }
                .tabItem{
                    Label("Favourite",systemImage: "star")
                }
                .tag("Favourite")
            Text("Person")
                .tabItem{
                    Label("Person",systemImage: "person")
                }
                .tag("Person") //*
            Text("PowerSleep")
                .tabItem{
                    Label("PowerSleep",systemImage: "powersleep")
                }
                .tag("PowerSleep")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
