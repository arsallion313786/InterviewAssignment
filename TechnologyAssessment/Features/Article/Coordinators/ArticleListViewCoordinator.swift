//
//  ArticleListViewCoordinator.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

final class ArticleListViewCoordinator:BaseCoordinator{
    
    
    override func start() {
        guard let controller = ArticlesViewBuilder.makeArticleListViewController() as? ArticleListVC else {
          return assertionFailure("Unable to initialize ArticleListViewController")
        }
        
        controller.didShowArticleDetail = { [weak self] article in
            self?.showArticleDetail(article: article)
        }
        
        self.router.setRootModule(controller)
    }
    
    
    func showArticleDetail(article:Article){
        guard let controller = ArticlesViewBuilder.makeArticleDetailViewController(article: article) as? ArticleDetailVC else {
          return assertionFailure("Unable to initialize ArticleDetailVC")
        }
        
        self.router.push(controller);
    }
}
