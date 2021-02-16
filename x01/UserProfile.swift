//
//  UserProfile.swift
//  x01
//
//  Created by Alec Henderson on 16/02/2021.
//

import Foundation

public struct UserProfile: Codable {
    let firstName: String
    let surname:String
    let model: String?
    let brand: String?
    let dob: String?
    let dartWeight: Int?
    let dexterity: String?

    enum CodingKeys: String, CodingKey {
        case firstName
        case surname
        case model
        case brand
        case dob
        case dartWeight
        case dexterity
    }

}
