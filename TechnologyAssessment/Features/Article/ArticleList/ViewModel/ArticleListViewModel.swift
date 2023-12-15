//
//  ArticleListViewModel.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation


// MARK: ArticlesViewState

enum ArticlesViewState {
  case idle
  case refreshList
  case refreshItemAtIndexPath(IndexPath)
  case showMessageWithTitle(title: String, message: String)
}

// MARK: Abstraction ArticlesListViewModel

protocol ArticlesListViewModeling {
  // Required State
  var viewStatePublisher: Published<ArticlesViewState>.Publisher { get }
  var screenTitle: String { get }
  var numberOfSections: Int { get }
  var numberOfRows: Int { get }
  
  // Required Behaviour
  func viewDidLoad()
  func articleViewModel(for indexPath: IndexPath) -> ArticleCellViewModel
}


final class ArticlesListViewModel {
    
    // MARK: Properties
    
    private let repo: ArticleRepo
    private var articleViewModels = [ArticleCellViewModel]()
    private var fetchTask: Task<Void, Never>?
    
    // MARK: Published properties
    
    @Published
    private var viewState = ArticlesViewState.idle
    
    // MARK: Initialization
    
    init(repo: ArticleRepo = ArticleRepoImpl()) {
      self.repo = repo
    }
    
    // MARK: Deinitailization
    
    deinit {
      fetchTask?.cancel()
    }
    
    // MARK: Utility methods
    
    private func fetchRecipes() {
      fetchTask = Task { @MainActor in
        do {
            articleViewModels = try await repo.fetchArticlesDataFromServer(section: "all-sections", period: "1").map {
            ArticleCellViewModel(article: $0)
          }
          viewState = .refreshList
        } catch {
          viewState = .showMessageWithTitle(
            title: "Article List",
            message: "Sorry! at the moment unable to fetch articles, please try again."
          )
        }
      }
    }
}


// MARK: RecipesListViewModeling conformance

extension ArticlesListViewModel: ArticlesListViewModeling {
  var screenTitle: String {
    "Articles"
  }
  
  var viewStatePublisher: Published<ArticlesViewState>.Publisher {
    $viewState
  }
  
  var numberOfSections: Int {
    1
  }
  
  var numberOfRows: Int {
    articleViewModels.count
  }
  
  func viewDidLoad() {
    fetchRecipes()
  }
  
  func articleViewModel(for indexPath: IndexPath) -> ArticleCellViewModel {
      articleViewModels[indexPath.row]
  }
  
}
