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
    
    var abstract:String{
        self.article.abstract
    }
    
    var publishDate:String{
        self.article.publishDate
    }
    
    var source:String{
        self.article.source
    }
    
    var url: URL {
        URL(string: self.article.media.mediaMetaData.first!.url)!
    }

    
    private (set) var article:Article
    init(article: Article) {
        self.article = article
    }
}
