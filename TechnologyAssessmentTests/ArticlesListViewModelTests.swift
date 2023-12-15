//
//  ArticlesListViewModelTests.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import XCTest
import Combine
@testable import TechnologyAssessment

final class ArticlesListViewModelTests: XCTestCase {

    var cancellable: AnyCancellable?
    
    override func tearDown() async throws {
      try await super.tearDown()
      cancellable = nil
    }
    
    func testInitialization_shouldHaveValidState() throws {
      // Given & When
      let viewModel = ArticlesListViewModel(
        repo: ArticlesDataStoreMock()
      )
      
      // Then
      XCTAssertEqual(viewModel.screenTitle, "Articles")
      XCTAssertEqual(viewModel.numberOfSections, 1)
      XCTAssertEqual(viewModel.numberOfRows, 0)
      XCTAssertNotNil(viewModel.viewStatePublisher)
    }
    
    func testViewDidLoad_whenSuccessful_shouldHaveArticles() throws {
      // Given
        let viewModel = ArticlesListViewModel(
          repo: ArticlesDataStoreMock()
        )
        
      let expectation = expectation(description: "Fetch articles")
      var viewState = ArticlesViewState.idle
      cancellable = viewModel.viewStatePublisher
        .sink { state in
          switch state {
          case .refreshList:
            viewState = state
            expectation.fulfill()
          default: break
          }
        }
      
      // When
      viewModel.viewDidLoad()
        wait(for: [expectation], timeout:50)
      
      // Then
      XCTAssertEqual(viewState, .refreshList)
      XCTAssertEqual(viewModel.numberOfSections, 1)
      XCTAssertEqual(viewModel.numberOfRows, 10)
        for index in 1...viewModel.numberOfRows {
          let articleViewModel = viewModel.articleViewModel(for: IndexPath(row: index-1, section: 0))
          
          XCTAssertEqual(articleViewModel.title, "Title for \(index)")
            XCTAssertEqual(articleViewModel.abstract, "Abstract for \(index)")
            XCTAssertEqual(articleViewModel.publishDate,"2023-12-\(index)")
            
            XCTAssertEqual(articleViewModel.source,"Source for \(index)")
            
            XCTAssertEqual(articleViewModel.url.absoluteString,"https://static01.nyt.com/images/\(index)")
        }
    }
    
    func testViewDidLoad_whenErrorOccured_shouldDisplayAlert() throws {
      // Given
      let datastore =  ArticlesDataStoreMock()
        datastore.result = .failure(.invalidServerResponse)
      let viewModel = ArticlesListViewModel(
        repo: datastore
      )
      let expectation = expectation(description: "Fetch articles")
      var viewState = ArticlesViewState.idle
      var alertTitle: String?
      var alertMessage: String?
      cancellable = viewModel.viewStatePublisher
        .sink { state in
          switch state {
          case let .showMessageWithTitle(title, message):
            viewState = state
            alertTitle = title
            alertMessage = message
            expectation.fulfill()
          default: break
          }
        }
      
      // When
      viewModel.viewDidLoad()
      wait(for: [expectation], timeout: 0.1)
      
      // Then
      XCTAssertEqual(alertTitle, "Article List")
      XCTAssertEqual(alertMessage, "Sorry! at the moment unable to fetch articles, please try again.")
      let state: ArticlesViewState = .showMessageWithTitle(title: "", message: "")
      XCTAssertEqual(viewState, state)
      XCTAssertEqual(viewModel.numberOfSections, 1)
      XCTAssertEqual(viewModel.numberOfRows, 0)
    }
    
    func testArticleViewModelAtIndexPath_whenCalled_shouldReturnViewModelAtThatIndexPath() {
      // Given
        
        let viewModel = ArticlesListViewModel(
          repo: ArticlesDataStoreMock()
        )
        
      let fetchArticlesExpectation = expectation(description: "Fetch articles")
      cancellable = viewModel.viewStatePublisher
        .sink { state in
          switch state {
          case .refreshList:
              fetchArticlesExpectation.fulfill()
          default: break
          }
        }
      viewModel.viewDidLoad()
      wait(for: [fetchArticlesExpectation], timeout: 0.2)
      
      // When
        var articleViewModel = viewModel.articleViewModel(for: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(articleViewModel.title, "Title for 1")
        XCTAssertEqual(articleViewModel.abstract, "Abstract for 1")
        XCTAssertEqual(articleViewModel.publishDate,"2023-12-1")
        
        XCTAssertEqual(articleViewModel.source,"Source for 1")
        
        XCTAssertEqual(articleViewModel.url.absoluteString,"https://static01.nyt.com/images/1")
        
        // When
      articleViewModel = viewModel.articleViewModel(for: IndexPath(row: 5, section: 0))
      
      // Then
        XCTAssertEqual(articleViewModel.title, "Title for 6")
        XCTAssertEqual(articleViewModel.abstract, "Abstract for 6")
        XCTAssertEqual(articleViewModel.publishDate,"2023-12-6")
        XCTAssertEqual(articleViewModel.source,"Source for 6")
        XCTAssertEqual(articleViewModel.url.absoluteString,"https://static01.nyt.com/images/6")
      
      // When
        articleViewModel = viewModel.articleViewModel(for: IndexPath(row: 8, section: 0))
      
      
      // Then
        XCTAssertEqual(articleViewModel.title, "Title for 9")
        XCTAssertEqual(articleViewModel.abstract, "Abstract for 9")
        XCTAssertEqual(articleViewModel.publishDate,"2023-12-9")
        XCTAssertEqual(articleViewModel.source,"Source for 9")
        XCTAssertEqual(articleViewModel.url.absoluteString,"https://static01.nyt.com/images/9")
    }
    
    
    
    func testViewDidLoad_with_live_Repo_whenSuccessful_shouldHaveArticles() throws {
        
        let viewModel = ArticlesListViewModel(
          repo: ArticleRepoImpl()
        )
        
      let expectation = expectation(description: "Fetch articles")
     
      cancellable = viewModel.viewStatePublisher
        .sink { state in
          switch state {
          case .refreshList:
            expectation.fulfill()
          default: break
          }
        }
      
      // When
      viewModel.viewDidLoad()
        wait(for: [expectation], timeout:50)
        XCTAssertEqual(viewModel.numberOfRows > 0, true)
    }
    
    
    
    

}


extension ArticlesViewState: Equatable {
  public static func == (lhs: ArticlesViewState, rhs: ArticlesViewState) -> Bool {
    switch (lhs, rhs) {
    case (.idle, .idle):
      return true
    case (.refreshList, .refreshList):
      return true
    case (.refreshItemAtIndexPath(_), .refreshItemAtIndexPath(_)):
      return true
    case (.showMessageWithTitle(_,_), .showMessageWithTitle(_,_)):
      return true
    default: return false
    }
  }
}
