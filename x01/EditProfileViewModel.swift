//
//  EditProfileViewModel.swift
//  x01
//
//  Created by Alec Henderson on 15/02/2021.
//

import Foundation

class EditProfileViewModel:ObservableObject{
    private let firebase : FirebaseProtocol
    @Published var selectedDexterity = "Right"
    @Published var selectedWeight = 22
    @Published var dob = Date()
    @Published var firstname = ""
    @Published var surname = ""
    @Published var brand = ""
    @Published var model = ""
    init (firebase : FirebaseProtocol = Firebase()){
        self.firebase = firebase
        populateData()
        readData()
    }
    
    func populateData(){
        let user = firebase.getLoggedInUserInfo()
        let fullNameArr = user?.displayName?.split{$0 == " "}.map(String.init)
        firstname =   fullNameArr?[0] ?? "" // First
        surname = fullNameArr?[1] ?? "" // Last
    }
    
    func readData(){
        firebase.readDocument(documentId: nil, collection: "userdata") { [self] (result, error) in
            if error == nil{
                if result != nil{
                    print(result)
                    firstname = result?["firstName"] as! String
                    surname = result?["surname"] as! String
                    brand = result?["brand"] as! String
                  //  dob = result?["dob"] as! Date
                    model = result?["model"] as! String
                    selectedDexterity = result?["dexterity"] as! String
                    selectedWeight = result?["dartWeight"] as! Int
                    
                    
                }
            }
        }
    }
    
    
    func saveData(){
        let data = ["model":model,
                    "brand":brand,
                    "dob":dob,
                    "dartWeight":selectedWeight,
                    "dexterity": selectedDexterity,
                    "firstName":firstname,
                    "surname": surname
        ] as [String : Any]
        firebase.saveDocument(documentId: nil, data: data, collection: "userdata")
        
    }
    
    
    
}
