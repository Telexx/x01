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
    let db = Firestore.firestore()
    
    
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
    
    func saveDocument(documentId:String?, data:[String:Any], collection:String){
        var ref: DocumentReference? = nil
        var docid: String
        if let userId = Auth.auth().currentUser?.uid {
            db.collection(collection).document(documentId ?? userId).setData(data) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    func readDocument(documentId:String?, collection:String, completion: @escaping ([String:Any]?, Error?) -> Void){
        if let userId = Auth.auth().currentUser?.uid {
        let docRef = db.collection(collection).document(documentId ?? userId)

            docRef.getDocument { [self] (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                completion(document.data() as [String : AnyObject]? ?? [:], nil)
            } else {
                completion(nil, error)
            }
            }
        }
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
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
       if let data = text.data(using: .utf8) {
           do {
               let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
               return json
           } catch {
               print("Something went wrong")
           }
       }
       return nil
   }
    
}


