////
////  LocalFileModal2.swift
////  Api-UnitTest-Sample
////
////  Created by Nitin Jaswal on 2023-03-24.
////
//
//import Foundation
//
//// MARK: - Welcome
//struct LocalFileModal2: Decodable {
//    let alias, welcomePrefix, suffix: String
//    let suggestions: [Suggestion]
//
//    enum CodingKeys: String, CodingKey {
//        case alias
//        case welcomePrefix = "prefix"
//        case suffix, suggestions
//    }
//}
//
//// MARK: - Suggestion
//struct Suggestion: Decodable {
//    let suggType, type, value, refTag: String
//    let widgetID: String?
//    let strategyID: String
//    let template: String?
//    let metadata: SuggestionMetadata?
//    let widgetItems: [WidgetItem]?
//    let candidateSources, strategyAPIType: String?
//    let prior: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case suggType, type, value, refTag
//        case widgetID = "widgetId"
//        case strategyID = "strategyId"
//        case template, metadata, widgetItems, candidateSources
//        case strategyAPIType = "strategyApiType"
//        case prior
//    }
//}
//
//// MARK: - SuggestionMetadata
//struct SuggestionMetadata: Decodable {
//    let headerPrefix, header, headerSuffix: String
//}
//
//// MARK: - WidgetItem
//struct WidgetItem: Decodable {
//    let id, type: String
//    let metadata: WidgetItemMetadata
//}
//
//// MARK: - WidgetItemMetadata
//struct WidgetItemMetadata: Decodable {
//    let linkURL, text: String
//
//    enum CodingKeys: String, CodingKey {
//        case linkURL = "link_url"
//        case text
//    }
//}
