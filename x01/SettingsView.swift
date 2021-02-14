//
//  SettingsView.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        Form {
            Section(header: Text("PROFILE ACTIONS")) {
                NavigationLink("Edit public profile", destination: EditProfileView())
                Button("Clear game data") {
                    //do something
                }
            }
            Section(header: Text("ABOUT")) {
                NavigationLink("View about", destination: EditProfileView())
                NavigationLink("Contact us", destination: EditProfileView())
                NavigationLink("Leave a review", destination: EditProfileView())
            }
            Section(header: Text("LEGAL")) {
                NavigationLink("Terms & Conditions", destination: EditProfileView())
                NavigationLink("Privacy Policy", destination: EditProfileView())
            }
            
            Section {
                Button("Save changes") {
                    // activate theme!
                }
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
