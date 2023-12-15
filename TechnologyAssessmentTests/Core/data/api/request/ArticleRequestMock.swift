//
//  ArticleRequestMock.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
@testable import TechnologyAssessment

enum ArticleRequestMock:RequestProtocol{
    case fetchArticles(section:String, period:String )
    
    var requestType: RequestType{
        .GET
    }
    
    var path: String{
        switch self {
        case .fetchArticles(_, _):
            "Articles.json";
        }
    }
    
    var urlParams: [String : String?]{
        [
            "api-key":APIConstants.apiKey
        ]
    }
}
