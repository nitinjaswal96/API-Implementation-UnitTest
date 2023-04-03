////
////  LocalFileModal3.swift
////  Api-UnitTest-Sample
////
////  Created by Nitin Jaswal on 2023-03-24.
////
//
//import Foundation
//
//struct LocalFileModal3: Codable {
//    let alias, prefix, suffix: String
//    let suggestions: [Suggestion]
//}
//
//enum Suggestion: Codable {
//    case keyword(Keyword)
//    case widget(Widget)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: TypeCodingKey.self)
//        let type = try container.decode(Type.self, forKey: .type)
//        switch type {
//        case .keyword:
//            self = try .keyword(Keyword(from: decoder))
//        case .widget:
//            self = try .widget(Widget(from: decoder))
//        }
//    }
//
//    enum TypeCodingKey: String, CodingKey {
//        case type
//    }
//
//    enum `Type`: String, Codable {
//        case keyword = "KEYWORD"
//        case widget = "WIDGET"
//    }
//
//    struct Keyword: Codable {
//        let type: Type
//        let suggType, value, refTag: String
//        let candidateSources, strategyId, strategyApiType: String
//        let prior: Int
//    }
//
//    struct Widget: Codable {
//        let type: Type
//        let suggType, value, refTag: String
//        let widgetId, strategyId, template: String
//        let metadata: Metadata
//        let widgetItems: [Item]
//
//        struct Metadata: Codable {
//            let headerPrefix, header, headerSuffix: String
//        }
//
//        struct Item: Codable {
//            let id, type: String
//            let metadata: Metadata
//
//            struct Metadata: Codable {
//                let linkURL, text: String
//
//                enum CodingKeys: String, CodingKey {
//                    case linkURL = "link_url"
//                    case text
//                }
//            }
//        }
//    }
//}
