//
//  RepoArticleTest.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import XCTest
@testable import TechnologyAssessment

final class RepoArticleTest: XCTestCase {
    
   
    func test_FetchArticles_whenSuccessfull_shouldReturnArticles() async throws{
        //Given
        let repo = ArticleRepoImplMock(requestManager: RequestManagerMock());
        
        //When
        let articles = try await repo.fetchArticlesDataFromServer(section: "all-sections", period: "7")
        
        
        // Then
        XCTAssertEqual(articles.count, 20)
        var article = articles[0]
        XCTAssertEqual(article.id, 100000009215537)
        XCTAssertEqual(article.title, "Universities Face Congressional Inquiry and Angry Donors Over Handling of Antisemitism")
        XCTAssertEqual(article.abstract, "Congress has opened an investigation into Harvard, M.I.T. and University of Pennsylvania, a $100 million gift was withdrawn, and demands have grown for the universities’ presidents to resign.")
        XCTAssertEqual(article.media.first!.mediaMetaData.first!.url, "https://static01.nyt.com/images/2023/12/07/multimedia/07nat-colleges-devels-mhjl/07nat-colleges-devels-mhjl-thumbStandard.jpg")
        XCTAssertEqual(article.publishedDate, "2023-12-07")
        XCTAssertEqual(article.source, "New York Times")
        
        article = articles[19]
        XCTAssertEqual(article.id, 100000009218301)
        XCTAssertEqual(article.title, "As Harvard President Faces Pressure to Resign, Some Faculty Show Support")
        XCTAssertEqual(article.abstract, "Claudine Gay, Harvard’s president, faced rising pressure after her answers to questions about antisemitism. Some faculty members signed a petition supporting her.")
        XCTAssertEqual(article.media.first!.mediaMetaData.first!.url, "https://static01.nyt.com/images/2023/12/10/multimedia/10nat-harvard-1-jpqz/10nat-harvard-1-jpqz-thumbStandard.jpg")
        XCTAssertEqual(article.publishedDate, "2023-12-10")
        XCTAssertEqual(article.source, "New York Times")
        
    }
    
    
    func testFetchArticles_whenErrorOccured_shouldThrowError() async {
        
        //Given
        let repo = ArticleRepoImplMock(requestManager: RequestManagerMock());
        repo.result = .failure(.invalidServerResponse)
        
        do {
          // When
          _ = try await repo.fetchArticlesDataFromServer(section: "", period: "7")
          XCTFail("Supposed to throw an error but succeded")
        } catch {
          // Then
          XCTAssertEqual(error as? NetworkError, NetworkError.invalidServerResponse)
        }
        
        
        do {
          // When
            repo.result = .failure(.invalidURL)
            _ = try await repo.fetchArticlesDataFromServer(section: "", period: "7")
          XCTFail("Supposed to throw an error but succeded")
        } catch {
          // Then
            XCTAssertEqual(error as? NetworkError, NetworkError.invalidURL)
        }
        
    }
    

}


extension NetworkError {
  public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidURL, .invalidURL):
      return true
    case (.invalidServerResponse, .invalidServerResponse):
      return true
    default: return false
    }
  }
}
