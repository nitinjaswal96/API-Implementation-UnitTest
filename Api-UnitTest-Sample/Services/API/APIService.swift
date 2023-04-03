//
//  APIService.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

protocol APIService {
    func send<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_: T?, _ error: APIError?) -> Void
    )
    
    func sendRequest<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_: [T]?, _ error: APIError?) -> Void
    )
    
    func sendLocalRequest<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_: T?, _ error: APIError?) -> Void
    )
}
