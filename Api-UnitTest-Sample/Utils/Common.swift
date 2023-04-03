//
//  Common.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

class Common {
    static let shared = Common()
    private init() {}
    
    let invalidFile = "Invalid File"
    let invalidUrl = "Invalid URL"
    let invalidResponse = "Invalid Response"
}
