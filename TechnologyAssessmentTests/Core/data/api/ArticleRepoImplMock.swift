//
//  ArticleRepoImplMock.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
@testable import TechnologyAssessment

class ArticleRepoImplMock{
    private let requestManager:RequestManagerProtocol
    var result: Result<Void, NetworkError> = .success(())
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
}

extension ArticleRepoImplMock:ArticleRepo{
    func fetchArticlesDataFromServer(section:String, period:String) async throws -> [Article] {
        switch result{
        case .success:
            let response:ArticleContainerModel  = try await self.requestManager.initRequest(with: ArticleRequestMock.fetchArticles(section: section, period: period))
            return response.results
        case let .failure(error):
            throw error
        }
    }
}
