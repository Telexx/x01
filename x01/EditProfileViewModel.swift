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
    }
    
    func populateData(){
       let user = firebase.getLoggedInUserInfo()
        let fullNameArr = user?.displayName?.split{$0 == " "}.map(String.init)
        firstname =   fullNameArr?[0] ?? "" // First
        surname = fullNameArr?[1] ?? "" // Last
    }
    
}
