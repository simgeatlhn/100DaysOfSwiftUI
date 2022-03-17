//
//  ContentView.swift
//  Notifications
//
//  Created by simge on 17.03.2022.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationView{
        VStack {
            Button("Request Permission") {
                // first
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            .foregroundColor(.mint)

            Button("Schedule Notification") {
                // second
                //**1-what you want to show
                let content = UNMutableNotificationContent()
                content.title = "Feed the dog"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                //**2-when to show
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                
                //**3-put those into the system
                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
            .foregroundColor(.indigo)
        }
        .navigationTitle("Notifications 💬")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
