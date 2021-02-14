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
    @Published var avatar = UIImage()
    
    
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
        default:
            return
        }
        
    }
    
}