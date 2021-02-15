//
//  FirebaseProtocol.swift
//  x01
//
//  Created by Alec Henderson on 12/02/2021.
//

import Foundation
import Firebase
protocol FirebaseProtocol{
    func login(username:String, password:String, completion: @escaping (Bool, Error?) -> Void)
    func register(username:String, password:String, completion: @escaping (Bool, Error?) -> Void)
    func getLoggedInUserInfo()->User?
    func getLoggedInUserAvatar(url:String,completion: @escaping (Bool, Error?) -> Void)
}
