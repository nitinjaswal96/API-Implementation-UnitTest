//
//  APIError.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

enum APIError: Error {
    case invalidFile
    case invalidURL
    case invalidResponse
    case failedRequest(description: String)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidFile:
            return Common.shared.invalidFile
        case .invalidURL:
            return Common.shared.invalidUrl
        case .invalidResponse:
            return Common.shared.invalidResponse
        case .failedRequest(let description):
            return description
        }
    }
}
