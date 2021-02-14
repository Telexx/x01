//
//  GameSettingsView.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import SwiftUI

struct GameSettingsView: View {
    
    @State private var enableLogging = false
     @State private var selectedColor = "Red"
     @State private var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
            Form {
                Section(footer: Text("Note: Enabling logging may slow down the app")) {
                 NavigationLink("Edit Profile", destination: EditProfileView())
                }

                Section {
                    Button("Save changes") {
                        // activate theme!
                    }
                }
            }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView()
    }
}
