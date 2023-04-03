////
////  LocalFileModal1.swift
////  Api-UnitTest-Sample
////
////  Created by Nitin Jaswal on 2023-03-23.
////
//
//import Foundation
//
//struct LocalFileModal1: Decodable {
//    let alias, prefix, suffix: String
//    let suggestions: [Suggestion]
//    
//    enum Suggestion: Decodable {
//        case keyword(Keyword)
//        case widget(Widget)
//        
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            let type = try values.decode(TypeSugg.self, forKey: .type)
//
//            switch type {
//            case .keyword:
//                self = try .keyword(Keyword(from: decoder))
//            case .widget:
//                self = try .widget(Widget(from: decoder))
//            }
//        }
//        
//        enum CodingKeys: String, CodingKey {
//            case type
//        }
//    }
//    
//    enum TypeSugg: String, Decodable {
//        case keyword = "KEYWORD"
//        case widget = "WIDGET"
//    }
//
//    struct Keyword: Decodable {
//        let suggType: String
//        let type: TypeSugg
//        let value, refTag, candidateSources, strategyID, strategyAPIType: String
//        let prior: Int
//        
//        enum CodingKeys: String, CodingKey {
//            case suggType, type, value, refTag, candidateSources
//            case strategyID = "strategyId"
//            case strategyAPIType = "strategyApiType"
//            case prior
//        }
//    }
//
//    struct Widget: Decodable {
//        let suggType: String
//        let type: TypeSugg
//        let value, refTag, widgetID, strategyID, template: String
//        let metadata: Metadata
//        let widgetItems: [WidgetItem]
//        
//        enum CodingKeys: String, CodingKey {
//            case suggType, type, value, refTag
//            case widgetID = "widgetId"
//            case strategyID = "strategyId"
//            case template, metadata, widgetItems
//        }
//        
//        struct Metadata: Decodable {
//            let headerPrefix, header, headerSuffix: String
//        }
//
//        struct WidgetItem: Decodable {
//            let id, type: String
//            let metadata: WidgetMetaData
//        }
//
//        struct WidgetMetaData: Decodable {
//            let linkURL: URL?
//            let text: String
//            
//            enum CodingKeys: String, CodingKey {
//                case linkURL = "link_url"
//                case text
//            }
//            
//            init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//
//                linkURL = URL(string: try values.decode(String.self, forKey: .linkURL))
//                text = try values.decode(String.self, forKey: .text)
//            }
//        }
//    }
//}
