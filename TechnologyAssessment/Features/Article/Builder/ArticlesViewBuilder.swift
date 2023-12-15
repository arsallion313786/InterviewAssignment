//
//  ArticlesViewBuilder.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
import UIKit
struct ArticlesViewBuilder{
    
    static func makeArticleListViewController() -> UIViewController?{
        UIStoryboard(name: .article)
          .instantiateInitialViewController { coder in
         ArticleListVC(viewModel: ArticlesListViewModel(repo: ArticleRepoImpl()), coder: coder)
        }
    }
    
}
