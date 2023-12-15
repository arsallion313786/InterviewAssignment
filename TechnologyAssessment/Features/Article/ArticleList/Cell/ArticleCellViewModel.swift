//
//  ArticleCellViewModel.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
struct ArticleCellViewModel{
    
    var title:String{
        self.article.title
    }
    
    var byLine:String{
        self.article.byline
    }
    
    var publishDate:String{
        self.article.publishedDate
    }
    
    var source:String{
        self.article.source
    }
    
    var url: URL? {
        if let urlStr = self.article.media.first?.mediaMetaData.first?.url{
           return  URL(string: urlStr)
        }
        return nil;
       
    }

    
    private (set) var article:Article
    init(article: Article) {
        self.article = article
    }
}
