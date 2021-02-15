//
//  SettingsView.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showingAlert = false
    var body: some View {
        Form {
            Section(header: Text("PROFILE ACTIONS")) {
                NavigationLink("Edit public profile", destination: EditProfileView(viewModel: EditProfileViewModel()))  .navigationBarTitleDisplayMode(.automatic)
                Button("Clear game data") {
                    showingAlert = true
                } .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
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
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
