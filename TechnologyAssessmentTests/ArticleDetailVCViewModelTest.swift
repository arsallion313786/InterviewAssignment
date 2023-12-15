//
//  ArtivleDetailVCViewModelTest.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import XCTest
import Combine
@testable import TechnologyAssessment

final class ArticleDetailVCViewModelTest: XCTestCase {
    
    var cancellable: AnyCancellable?
    
    override func tearDown() async throws {
      try await super.tearDown()
      cancellable = nil
    }
    
    func testInitialization_shouldHaveValidArticleData() throws {
        
        let article = Article(
            id: 1,
            title: "Title",
            byline: "byline",
            abstract: "abstract",
            publishedDate: "23-12-12",
            source: "source",
            media: [Media(type: "type",
                          mediaMetaData: [MediaMetaData(
                            url: "https://static01.nyt.com/images/2023/12/07/multimedia/07nat-colleges-devels-mhjl/07nat-colleges-devels-mhjl-thumbStandard.jpg",
                            format: "thumbail")])])
        
        //Given And When
        let viewModel = ArticleDetailVCViewModel(article: article)
        
        
        
        //Then
        let expectation = expectation(description: "Populate Article Detail View Model")
        var viewModelArticleDetail:ArticleDetailViewModel!
        self.cancellable =    viewModel.$articleDetailViewModel
            .sink { articleViewModel in
                viewModelArticleDetail = articleViewModel
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout:0.2)
        XCTAssertEqual(viewModelArticleDetail.title, article.title)
        XCTAssertEqual(viewModelArticleDetail.byLine, article.byline)
        XCTAssertEqual(viewModelArticleDetail.publishDate,article.publishedDate)
          
        XCTAssertEqual(viewModelArticleDetail.source,article.source)
          
        XCTAssertEqual(viewModelArticleDetail.url!.absoluteString,article.media.first!.mediaMetaData.first!.url)
        
    }

}
