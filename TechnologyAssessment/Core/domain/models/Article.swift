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
    let media:Media
   
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
