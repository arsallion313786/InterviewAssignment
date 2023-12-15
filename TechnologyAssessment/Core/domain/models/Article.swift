//
//  Article.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

struct ArticleContainerModel:Decodable{
    let status:String
    let results:[Article]
}


struct Article:Decodable{
    let id:Int
    let title:String
    let byline:String
    let abstract:String
    let publishedDate:String
    let source:String
    let media:[Media]
    
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case byline
        case abstract
        case publishedDate = "published_date"
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


//struct ArticleTempContainer: Codable {
//    enum CodingKeys: String, CodingKey, CaseIterable {
//        case copyright
//        case numResults = "num_results"
//        case results
//        case status
//    }
//
//    let copyright: String
//    let numResults: Int
//    let results: [Result]
//    let status: String
//
//    init(copyright: String, numResults: Int, results: [Result], status: String) {
//        self.copyright = copyright
//        self.numResults = numResults
//        self.results = results
//        self.status = status
//    }
//}
//
//struct Result: Codable {
//    enum CodingKeys: String, CodingKey, CaseIterable {
//        case abstract
//        case adxKeywords = "adx_keywords"
//        case assetId = "asset_id"
//        case byline
//        case column
//        case desFacet = "des_facet"
//        case etaId = "eta_id"
//        case geoFacet = "geo_facet"
//        case id
//        case media
//        case nytdsection
//        case orgFacet = "org_facet"
//        case perFacet = "per_facet"
//        case publishedDate = "published_date"
//        case section
//        case source
//        case subsection
//        case title
//        case type
//        case updated
//        case uri
//        case url
//    }
//
//    let abstract: String
//    let adxKeywords: String
//    let assetId: Int
//    let byline: String
//    let column: Any
//    let desFacet: [String]
//    let etaId: Int
//    let geoFacet: [GeoFacet]
//    let id: Int
//    let media: [Media]
//    let nytdsection: String
//    let orgFacet: [String]
//    let perFacet: [String]
//    let publishedDate: Date
//    let section: String
//    let source: String
//    let subsection: String
//    let title: String
//    let type: String
//    let updated: String
//    let uri: String
//    let url: URL
//
//    init(abstract: String, adxKeywords: String, assetId: Int, byline: String, column: Any, desFacet: [String], etaId: Int, geoFacet: [GeoFacet], id: Int, media: [Media], nytdsection: String, orgFacet: [String], perFacet: [String], publishedDate: Date, section: String, source: String, subsection: String, title: String, type: String, updated: String, uri: String, url: URL) {
//        self.abstract = abstract
//        self.adxKeywords = adxKeywords
//        self.assetId = assetId
//        self.byline = byline
//        self.column = column
//        self.desFacet = desFacet
//        self.etaId = etaId
//        self.geoFacet = geoFacet
//        self.id = id
//        self.media = media
//        self.nytdsection = nytdsection
//        self.orgFacet = orgFacet
//        self.perFacet = perFacet
//        self.publishedDate = publishedDate
//        self.section = section
//        self.source = source
//        self.subsection = subsection
//        self.title = title
//        self.type = type
//        self.updated = updated
//        self.uri = uri
//        self.url = url
//    }
//}
//
//struct Media: Codable {
//    enum CodingKeys: String, CodingKey, CaseIterable {
//        case approvedForSyndication = "approved_for_syndication"
//        case caption
//        case copyright
//        case mediametadata = "media-metadata"
//        case subtype
//        case type
//    }
//
//    let approvedForSyndication: Int
//    let caption: String
//    let copyright: String
//    let mediametadata: [Media-metadata]
//    let subtype: String
//    let type: String
//
//    init(approvedForSyndication: Int, caption: String, copyright: String, mediametadata: [Media-metadata], subtype: String, type: String) {
//        self.approvedForSyndication = approvedForSyndication
//        self.caption = caption
//        self.copyright = copyright
//        self.mediametadata = mediametadata
//        self.subtype = subtype
//        self.type = type
//    }
//}
//
//struct Media-metadata: Codable {
//    enum CodingKeys: String, CodingKey, CaseIterable {
//        case format
//        case height
//        case url
//        case width
//    }
//
//    let format: String
//    let height: Int
//    let url: URL
//    let width: Int
//
//    init(format: String, height: Int, url: URL, width: Int) {
//        self.format = format
//        self.height = height
//        self.url = url
//        self.width = width
//    }
//}
