//
//  ArticleRequest.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
enum ArticleRequest:RequestProtocol{
    case fetchArticles(section:String, period:String )
    
    var requestType: RequestType{
        .GET
    }
    
    var path: String{
        switch self {
        case .fetchArticles(let section, let period):
            "/svc/mostpopular/v2/mostviewed/\(section)/\(period).json"
        }
    }
    
    var urlParams: [String : String?]{
        [
            "api-key":APIConstants.apiKey
        ]
    }
    
    
    
    
}
