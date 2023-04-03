//
//  CreateAPI+APIRequest.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-23.
//

import Foundation

struct CreateAPI: Encodable {
    let name: String
    let userSalary: SalaryInfo
    let age: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case userSalary_salary = "salary"
        case age
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(userSalary.salary, forKey: .userSalary_salary)
        try container.encode(age, forKey: .age)
    }
}

struct SalaryInfo: Encodable {
    let salary: String
}

struct CreateAPIRequest: APIRequest {
    var body: Encodable?
    
    init(body: CreateAPI) {
        self.body = body
    }
    
    var path: String { "create" }
    var method: RequestMethod { .post }
}
