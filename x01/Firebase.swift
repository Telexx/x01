//
//  Login.swift
//  Oddly
//
//  Created by Alec Henderson on 13/02/2021.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
class Firebase: FirebaseProtocol{
    
    
    let storage = Storage.storage()
    let defaults = UserDefaults.standard
    
    
    
    func login(username:String, password:String, completion: @escaping (Bool, Error?) -> Void){
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if error == nil{
                completion(true, nil)
                self!.updateUserInformation()
            }
            else{
                completion(false, error)
            }
        }
    }
    
    func register(username:String, password:String, completion: @escaping (Bool, Error?) -> Void){
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if error != nil{
                completion(false, error)
            }
            else{
                completion(true, nil)
            }
        }
    }
    
    func updateUserInformation(){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "Alec Henderson"
        changeRequest?.commitChanges { (error) in
            print("Changes Commited")
        }
        
    }
    
    func getLoggedInUserInfo()->User?{
        let user = Auth.auth().currentUser
        if let user = user {
            return user
        }
        return nil
    }
    
    func getLoggedInUserAvatar(url:String, completion: @escaping (Bool, Error?) -> Void){
        let httpsReference =  storage.reference(withPath: "profilepictures/alec.jpg")
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                completion(false, error)
            } else {
                // Data for "images/island.jpg" is returned
                self.defaults.set(data!, forKey: "ProfilePicture")
                completion(true,nil)
            }
        }
    }
    
}


