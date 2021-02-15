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
    
    
    init (firebase : FirebaseProtocol = Firebase()){
        self.firebase = firebase
        firebase.getLoggedInUserAvatar { [self] (success, error) in
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
