//
//  LoginModal.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-23.
//

import Foundation

struct LoginModal: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData: Decodable {
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
