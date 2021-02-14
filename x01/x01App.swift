//
//  x01App.swift
//  x01
//
//  Created by Alec Henderson on 07/02/2021.
//

import SwiftUI

@main
struct x01App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init(){
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: LoginViewModel())   .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
