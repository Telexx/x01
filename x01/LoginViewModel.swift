//
//  LoginViewModel.swift
//  Oddly
//
//  Created by Alec Henderson on 13/02/2021.
//

import Foundation
class LoginViewModel: ObservableObject{
    @Published var isLoggedIn = false
    @Published var loginError = false
    @Published var didSignUp = false
    @Published var didTapSignup = false
    @Published var signupError = false
    var signupErrorText = ""
    var loginErrorText = ""
    private let firebase : FirebaseProtocol
    
    init (firebase : FirebaseProtocol = Firebase()){
        self.firebase = firebase
    }
    
    
    func login(username:String, password:String){
        firebase.login(username: "alecghenderson@gmail.com", password: "Radi0h34d") { [self] (result, error) in
            if error != nil{
                loginError = true
                loginErrorText = error!.localizedDescription
            }
            isLoggedIn = result
        }
    }
    
    func register(username:String, password:String){
        firebase.register(username: username, password: password) { [self] (result, error) in
            if error != nil{
                signupErrorText = error!.localizedDescription
                signupError = true
            }
            else{
                didSignUp = true
            }
        }
        
    }

}
