//
//  FirebaseProtocol.swift
//  x01
//
//  Created by Alec Henderson on 12/02/2021.
//

import Foundation

protocol FirebaseProtocol{
    func login(username:String, password:String, completion: @escaping (Bool, Error?) -> Void)
    func register(username:String, password:String, completion: @escaping (Bool, Error?) -> Void)
    func getLoggedInUserInfo()
    func getLoggedInUserAvatar(completion: @escaping (Bool, Error?) -> Void)
}
