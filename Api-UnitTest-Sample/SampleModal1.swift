//
//  SampleModal1.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-23.
//

import Foundation

struct SampleModal1: Decodable {
    let status: String
    let data: SampleModal1Data
}

struct SampleModal1Data: Decodable {
    let name, salary, age: String
    let id: Int
}
