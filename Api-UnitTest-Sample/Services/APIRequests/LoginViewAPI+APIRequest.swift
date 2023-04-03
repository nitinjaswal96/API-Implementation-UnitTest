//
//  LoginViewAPI+APIRequest.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-23.
//

import Foundation

struct LoginViewAPI {
    let userEmail, userPassword: String
}

extension LoginViewAPI: APIRequest {
    var path: String { "Login" }
    var method: RequestMethod { .post }
    var headers: HTTPHeaders? {
        let headers: HTTPHeaders = ["content-type" : "application/json"]
        return headers
    }
    var body: JSON? {
        let params: JSON = [
            "userEmail": userEmail,
            "userPassword": userPassword
        ]
        return params
    }
}
