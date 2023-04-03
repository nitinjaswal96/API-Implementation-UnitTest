//
//  APIConstant.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

typealias JSON = [String: Any]
typealias HTTPHeaders = [String: String]
enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
    var stringValue: String {
        self.rawValue
    }
}

enum LocalFileType: String {
    case json = "json"
    
    var stringValue: String {
        self.rawValue
    }
}

struct APIConstant {
    static let shared = APIConstant()
    private init() {}
    
    //"https://gorest.co.in/public/v2/"
    let baseURL: String = "https://api-dev-scus-demo.azurewebsites.net/api/User/"
}
