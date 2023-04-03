//
//  APIRequest.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

protocol APIRequest {
    var fileExtension: LocalFileType? { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: HTTPHeaders? { get }
    var body: JSON? { get }
    //var body: Encodable? { get set }
}

extension APIRequest {
    var fileExtension: LocalFileType? { .json }
    var method: RequestMethod { .get }
    var headers: HTTPHeaders? { nil }
    var body: JSON? { nil }
}












//    var body: Encodable? {
//        get {
//            nil
//        } set {
//            debugPrint(newValue)
//        }
//    }
