//
//  LocalFileModal1_1.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-04-02.
//

import Foundation

struct LocalFileModal1_1: Decodable {
    let alias, prefix, suffix: String
    let suggestions: [Suggestion]
    
    enum Suggestion: Decodable {
        case widget(Widget)
        case keyword(Keyword)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(WidgOrKeywordType.self, forKey: .type)
            
            switch type {
            case .widget:
                self = try .widget(Widget(from: decoder))
            case .keyword:
                self = try .keyword(Keyword(from: decoder))
            }
        }
        
        enum WidgOrKeywordType: String, Decodable {
            case widget = "WIDGET"
            case keyword = "KEYWORD"
        }

        struct Widget: Decodable {
            let suggType: String
            let type: WidgOrKeywordType
            let value, refTag, widgetID, strategyID, template: String
            let metadata: Metadata
            let widgetItems: WidgetItems
            
            enum CodingKeys: String, CodingKey {
                case suggType, type, value, refTag
                case widget_ID = "WidgetId"
                case strategyID = "strategyId"
                case template, metadata, widgetItems
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                suggType = try container.decode(String.self, forKey: .suggType)
                type = try container.decode(WidgOrKeywordType.self, forKey: .type)
                value = try container.decode(String.self, forKey: .value)
                refTag = try container.decode(String.self, forKey: .refTag)
                widgetID = try container.decode(String.self, forKey: .widget_ID)
                strategyID = try container.decode(String.self, forKey: .strategyID)
                template = try container.decode(String.self, forKey: .template)
                metadata = try container.decode(Metadata.self, forKey: .metadata)
                widgetItems = try container.decode(WidgetItems.self, forKey: .widgetItems)
            }
            
            struct Metadata: Decodable {
                let headerPrefix, header, headerSuffix: String
            }
            
            struct WidgetItems: Decodable {
                let id, type: String
                let metadata: Metadata

                struct Metadata: Decodable {
                    let linkURL: URL?
                    let text: String
                    
                    enum CodingKeys: String, CodingKey {
                        case linkURL = "link_url"
                        case text
                    }
                    
                    init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        linkURL = URL(string: try container.decode(String.self, forKey: .linkURL))
                        text = try container.decode(String.self, forKey: .text)
                    }
                }
            }
        }
        
        struct Keyword: Decodable {
            let suggType: String
            let type: WidgOrKeywordType
            let value, refTag, candidateSources, strategyID, strategyApiType: String
            let prior: Int
            
        }
    }
}


