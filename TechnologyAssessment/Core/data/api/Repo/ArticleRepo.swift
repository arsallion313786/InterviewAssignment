//
//  ArticleRepo.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
protocol ArticleRepo {
    func fetchArticlesDataFromServer(section:String, period:String) async throws ->  [Article]
}

class ArticleRepoImpl{
    private let requestManager:RequestManagerProtocol
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
}

extension ArticleRepoImpl:ArticleRepo{
    func fetchArticlesDataFromServer(section:String, period:String) async throws -> [Article] {
        let response:ArticleContainerModel  = try await self.requestManager.initRequest(with: ArticleRequest.fetchArticles(section: section, period: period))
        return response.results
    }
}

