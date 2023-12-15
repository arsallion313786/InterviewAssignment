//
//  ArticlesDataStoreMock.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
@testable import TechnologyAssessment

final class ArticlesDataStoreMock: ArticleRepo {
    
    
  
  var result: Result<[Article], NetworkError> = .success(Article.articles(10))
  
    func fetchArticlesDataFromServer(section: String, period: String) async throws -> [Article] {
    switch result {
    case let .failure(error):
      throw error
    case let .success(Articles):
      return Articles
    }
  }
}

private extension Article {
  static func articles(_ count: Int) -> [Article] {
    Array(1...count).map { index in
        Article.article(index: index)
    }
  }
  
  static func article(index: Int) -> Article {
      Article(
        id: index,
        title: "Title for \(index)",
        byline:  "ByLine for \(index)",
        abstract:  "Abstract for \(index)",
        publishedDate: "2023-12-\(index)",
        source: "Source for \(index)",
        media: [Media(
            type: "image",
            mediaMetaData: [MediaMetaData(
                url: "https://static01.nyt.com/images/\(index)",
                format: "Standard Thumbnail")])])
  }
}
