//
//  ArticleDetailVCViewModel.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
import Combine

class ArticleDetailVCViewModel{
    
    @Published
    private(set) var articleDetailViewModel:ArticleDetailViewModel? = nil;
    init(article:Article) {
        self.articleDetailViewModel =  ArticleDetailViewModel(article: article)
    }
}


