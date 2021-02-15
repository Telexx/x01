//
//  MenuViewModel.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import Foundation
import UIKit
class MenuViewModel: ObservableObject{
    let defaults = UserDefaults.standard
    private let firebase : FirebaseProtocol
    @Published var didStartGameComputer = false
    @Published var didStartGameLocal = false
    @Published var didOpenSettings = false
    @Published var avatar = UIImage(systemName: "person.circle.fill")!
    @Published var firstName = ""
    @Published var lastName = ""
    
    init (firebase : FirebaseProtocol = Firebase()){
        self.firebase = firebase
       var user = firebase.getLoggedInUserInfo()
        let fullNameArr = user?.displayName?.split{$0 == " "}.map(String.init)
        firstName =   fullNameArr?[0] ?? "" // First
        lastName = fullNameArr?[1] ?? "" // Last
        firebase.getLoggedInUserAvatar(url: user?.photoURL?.absoluteString ?? "") { [self] (success, error) in
            if error == nil{
                let avatarData = defaults.data(forKey: "ProfilePicture")!
                avatar = UIImage(data: avatarData)!
            }
        }

    }
    
    func didTapMenuItem(item: Int){
        switch item{
        case 0:
            print("item 0 selected")
            didStartGameComputer = true
        case 1:
            print("item 1 selected")
            didStartGameLocal = true
        case 4:
            print("item 4 selected")
            didOpenSettings = true
        default:
            return
        }
        
    }
    
}
