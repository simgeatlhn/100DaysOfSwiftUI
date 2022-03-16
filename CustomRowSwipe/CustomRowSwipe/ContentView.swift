//
//  ContentView.swift
//  CustomRowSwipe
//
//  Created by simge on 16.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Simge Atlıhan")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
