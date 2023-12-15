//
//  ArticleListViewCoordinator.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

final class ArticleListViewCoordinator:BaseCoordinator{
    
    
    override func start() {
        guard let controller = ArticlesViewBuilder.makeArticleListViewController()else {
          return assertionFailure("Unable to initialize ArticleListViewController")
        }
        self.router.setRootModule(controller)
    }
}
