//
//  Article.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

struct Article:Decodable{
    let id:Int
    let title:String
    let byline:String
    let abstract:String
    let publishDate:String
    let source:String
    let media:Media
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case byline
        case abstract
        case publishDate = "published_date"
        case source
        case media
    }
    
    
}

struct Media:Decodable{
    let type:String
    let mediaMetaData: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case type
        case mediaMetaData = "media-metadata"
    }
    
}

struct MediaMetaData:Decodable{
    let url:String
    let format:String
    
}
