//
//  FirebaseMock.swift
//  x01Tests
//
//  Created by Alec Henderson on 12/02/2021.
//

import Foundation
@testable import x01
class MockFirebase: FirebaseProtocol{
    func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
    }
    
    func register(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
    }
    
    func getLoggedInUserInfo() {
        
    }
    
    func getLoggedInUserAvatar(completion: @escaping (Bool, Error?) -> Void) {
        
    }
    
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
 
}
